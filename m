Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6233E376BD0;
	Thu,  6 Aug 2026 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786025642; cv=none; b=iOdx2RPg8a0hEsnTGx4wNHIGDsWeqs/jYSxP1ENIwRBNE+XvGQ6Zff3F4fD1rtyI9TeNjejNkshmbTyoDJ0OLp2/MYyAGJEmeDCla8LktlkEF5RzpvQ1G4vN04tLM0Y8p8hbvpq3h6g7kgdSGxyPY/mlPGpe6vcaCOWhuBf5RyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786025642; c=relaxed/simple;
	bh=ZpDl/a5AWUb9Xh9TmUt0U2ZY/97JoXIWQuhTVJEK62U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JIhVi9b3zI2Ie2+fPpmM5FksxOUAUidhpnaE+KOumPy/IW0aPKqB+h8IFnZmXXMU9oGil9U6jz4WSM7ulnGlJWkC58Pqr0dtrnIBXVZ7S9iTzwZ9nnORtyW3nnrP1e3T3PmbyEc5FslCzNr1nuWx1OIRII5gaTAVqNWpEB5Ng4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZp32xZj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZp32xZj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7518D1F00A3D;
	Thu,  6 Aug 2026 14:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786025636;
	bh=dZeDFAqEshByzjA/mSVQdHjkZOyMHsQvuWJ74Iw1D4M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CZp32xZjxrC7V2gxlHiTViRFTsAqzo7h9JoWupydsRjvHKT8SUd7dLHvLcRT2e9y1
	 ZZmamqNXK59eJ/+xMwqio74sIL+mgr7BgSlbsQFngiL4pw8mfY1JbNYvtAfxLGl6/d
	 pocDoY7Hh8SsfNAuyt79RgBzWYZTnA11OidmiMMTiOR8Vj9zPMtPd7NfppM5KEJRtV
	 CrOW/AksKA5Nzpn6o0qGPYV7tNqzXQ8+y8Lz/vst04A1dHkuUq1PghWsx2/wchia8n
	 4ZsLyV3DGBhtWsaIf9OGkyWPiZxsoCazGBSs0kSZy2NZp7LH5HPsVwnPcIgRp6HaL1
	 4JMdxdgnX5uUg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
References: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v8 0/4] leds: pca963x: Add multicolor support
 and enable Monza RGB LEDs
Message-Id: <178602563322.2946361.10007552252673111608.b4-ty@b4>
Date: Thu, 06 Aug 2026 15:13:53 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 27 Jul 2026 16:54:32 +0200, Loic Poulain wrote:
> Some devices use PCA963x controllers to drive RGB LEDs, where
> multiple PWM channels correspond to a single logical LED. Add
> support for grouping such channels into a multicolor LED device,
> using the LED multicolor class framework.
> 
> The DT bindings are extended to describe these groupings via a
> multi-led@N node with sub-nodes representing individual color
> channels. This follows conventions used by other multicolor LED
> drivers, while maintaining full backward compatibility with
> existing single-color LED definitions.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635
      commit: b765b508bdd5501386ceae6f96a70ddd45675f9e
[2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED support
      commit: 160c78e69c3b2a8be44de28cb27f3f04d85a7235
[3/4] leds: pca963x: add multicolor LED class support
      commit: cd5d8dcd4ad756749667f3e73ac87927d0f080e9

--
Lee Jones [李琼斯]

