Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1709D53A89D;
	Wed, 14 Oct 2026 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990816; cv=none; b=c7SO4rnJlO60ji9Tqf+kQjTzmVCkaiPGy5BFL34bage7ow3vo9szwPI5F0UucJCBweRE4qIQfbq6DDQXWh+XyVsRtNkpLO2fNmmDI9kI4PzCkpCu95krTcghFNs0aX3P7pc1zSvutAjjBSwQnCmEjmwP5Up4K6mGUXTcDWmexTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990816; c=relaxed/simple;
	bh=jBgb15BQLllnb4yzsOT86mrINjzXs3alB4e+A2lzCc0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HUiNgNyY9xHIiAG/RWhlGBXi9LjH6/cD2EJFEB2xoVVfAYk3iFz2cdsevpZbGDw7CTUg0pMx3ubM88kx4yUZzpQauHi7ZMUSROHFPzTHQuEk8EA3ISqYBm6hZn4xNv4ITEDk5W79s+R4gMCByNwn4NuypzXtLoMvGZ4zx2w0AmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHey9sg3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHey9sg3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58CD91F000C4;
	Wed, 14 Oct 2026 15:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791990814;
	bh=FrxFkPouUX7J3dMs9YlY5xB8iQroELxdLCqQHW3LfOE=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=cHey9sg3+lCHoFj3hr892jH7v1xEtX8s45Jd4Peda4EfEj3TF+L1dZ/H6E4mIwH7r
	 Ru0ioyPouP4MjXVUalSHHJnTnpO9vVR7yyNctjxl+3QY3YSmEqa6E/m9RAW335bape
	 vQe97ZDe6b+/yden86dQFgI1q5lS34Y6I3bHT8oTg0HvQ+V2ReIFg4tjOdUNAlq2gU
	 YJkv9stjN9n5ihsv7XcoAlD+BaJzugbAMAv9UPINeJU0gvHoD/oOGPicCBkGVy77Ix
	 XYqsTCVizQzwA2fBADd7zDb4bJCHwHGn/rp69ZAdf3zG0U+Vd80qkKruLQ9+Lgef3x
	 pWyX1HmmWjUlQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Artur Weber <aweber.kernel@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Kiran Gunda <quic_kgunda@quicinc.com>, 
 Aleksandrs Vinarskis <alex@vinarskis.com>, Andrew Davis <afd@ti.com>, 
 Steffen Trumtrar <kernel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260913123301.100129-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913123301.100129-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] dt-bindings: leds: Use consistent indentation
 in the example
Message-Id: <179199081109.1187066.13808287583904986298.b4-ty@b4>
Date: Wed, 14 Oct 2026 16:13:31 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sun, 13 Sep 2026 14:33:02 +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.

Applied, thanks!

[1/1] dt-bindings: leds: Use consistent indentation in the example
      commit: dc8aec7428160492252267cbc0f78b889f7cae01

--
Lee Jones [李琼斯]

