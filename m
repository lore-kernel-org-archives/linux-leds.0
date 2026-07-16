Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EBB422536;
	Thu, 16 Jul 2026 13:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207290; cv=none; b=jEb5qjp1jMSCg5pDfnHbfoOqXFFsFhEKZuthFMrDk2X5I24+gx/Tmek7uSAV36ksNi138c+LheavQBmA8zF0MELhplQYA1TJOEROtoNvToMvTZTgNOWFz6IIwNcW77sYJhRGkkA7uy9K3bksBir3wTMWyWnxS7f+ustpmyXLGYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207290; c=relaxed/simple;
	bh=NHWdFRHsjfAEVj9ehdcgejppFAoD8FBlB6+g2PxYo9Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CgkrV6Xjx6lZfvq4Ssr3o8pg7MyI6hcyuplf0209CJSRPiHN2GbQvrE2CP+MtBYswVzN+XdbblLkZfOQj5uX0rc6TlNpUSCAOqvEAkUltSIY/f0+4ZUYv1RhooSwO0HaljmiMfLGYVuXjWDTODzdmuR/YQPZVc46hiTITnRtaa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U73bS1DP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U73bS1DP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A901F000E9;
	Thu, 16 Jul 2026 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784207288;
	bh=0Zby8rUww5DgSB7WsvxkwhJTKhb2piVNdDECZG5/Hlg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=U73bS1DPmQLRkA5pr4dWNPPh+nyimu95guHIukd0RNAmR3B3g7gM2zSlhM+C6KpaL
	 Q2GBn2HApZnyTH2R1+um7C1TCmOilluTJhkhoHVzEw9WsjZzsmhVIjXHjxTVaG1K/g
	 3U5NrMvXeoWoJDeg6KCXW3mXJdgqWzgCUxYhgf6bwguUwuYMmVwwtULDQypt+iOOL6
	 bt2dWr+ltaFFAQVZ60lYTczrBwGpFR4pR7Zhgy1lGKByFOsL656bfQXjcYaar/zl8Q
	 fvXYG60AnP8d2abiyQu2oTibbbal+waHZKhSfucSess7c0etb7iXWCVKI+BhsQ/fvj
	 hxxhXDml16ysg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, noltari@gmail.com, Ninad Naik <ninadnaik07@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org, me@brighamcampbell.com
In-Reply-To: <20260707184437.500278-1-ninadnaik07@gmail.com>
References: <20260707184437.500278-1-ninadnaik07@gmail.com>
Subject: Re: (subset) [PATCH v3] dt-bindings: leds: bcm6358: Convert to DT
 schema
Message-Id: <178420728614.1348593.16669026578476244176.b4-ty@b4>
Date: Thu, 16 Jul 2026 14:08:06 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 08 Jul 2026 00:14:28 +0530, Ninad Naik wrote:
> Convert the brcm,bcm6358 to DT schema.

Applied, thanks!

[1/1] dt-bindings: leds: bcm6358: Convert to DT schema
      commit: 627666f7c9cd89e7c4023ba790a44610ccfb9471

--
Lee Jones [李琼斯]

