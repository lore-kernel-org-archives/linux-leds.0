Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37104AF9F4;
	Mon, 21 Sep 2026 17:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012981; cv=none; b=h5ZbjCxqRD9v8xfVoz4pcWUQ+jRSSbH9g81gkK1iillGmV17JCZ+K6kgM1Xq/rKHdndecxdFd9OZQ04B36BmB74Pw6AOyCS2mG+mAigghLrJz6CUvsY8Pf096jYGVdi3zS2n3ZItNJXn5Z45G7u8KWq65cRWdpbco8V1AyEQu1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012981; c=relaxed/simple;
	bh=eA1hWVHqWPJJMO/8JMSy+3AzNIFbsM9Ofw6Yh7syOD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnKrF11e87Lx1ps5Ns7a6P5xhFI4WoA5Q4AEzaudy3vhyhEuGPw44IGzXDgyNXiWaMQw6t6XZ6tzppHEJyCddWdogMdvsNPszgXHYzItDYWy7AB0qU195V1KWDzCSHhhigmiNMP9BRzwhjKewNSAWkFkNbGczUAUTkItlcRSuo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuiPcNx4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuiPcNx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3051F000FF;
	Mon, 21 Sep 2026 17:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790012979;
	bh=ljunNeE8kPEp4/5uzgfcM5oIGquaBg60ldIjslW4ZUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZuiPcNx4PAM6dGL5xgpIbZN8P/pusIrHqbCzRcbyGPoMB4uCQWh7B3clhEpL5uaPX
	 Rknv9tBOBlDN7uhcLWD1FeIgbP5Ee8H/G+AdgrPP52SNao7yy7r/Jl4Ghy7Sy7jGTg
	 MTl30nSDaPMg22X4p9euZL/WKCL6uy50/QjAZjJhOwjPKdWWnZYW35uorw6Va5r8qS
	 2grqfFL3iziF72m400A+El80ZbfXTswoZOIE0gu9mnTVaXvRGNdfNLhlLTD7MLkzo3
	 AZ1FuFkISXLz3QJo3Wr+rz801/k2Ctl9mS3x7yok5iz03/1nvTJ+2u8hwa1JxhKtCL
	 IAUPdzx0tOgRQ==
Date: Mon, 21 Sep 2026 12:49:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Kiran Gunda <quic_kgunda@quicinc.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	Lee Jones <lee@kernel.org>,
	Steffen Trumtrar <kernel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: leds: Use consistent indentation in the
 example
Message-ID: <179001297680.1073319.11422853930402434820.robh@kernel.org>
References: <20260913123301.100129-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913123301.100129-2-krzysztof.kozlowski@oss.qualcomm.com>


On Sun, 13 Sep 2026 14:33:02 +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../leds/backlight/lm3630a-backlight.yaml     | 52 +++++++++----------
>  .../leds/backlight/lp855x-backlight.yaml      | 18 +++----
>  .../bindings/leds/backlight/qcom-wled.yaml    |  2 +-
>  .../bindings/leds/leds-consumer.yaml          | 14 ++---
>  .../devicetree/bindings/leds/leds-lp50xx.yaml | 12 ++---
>  .../devicetree/bindings/leds/leds-lp5860.yaml | 12 ++---
>  .../devicetree/bindings/leds/nxp,pca963x.yaml | 24 ++++-----
>  7 files changed, 67 insertions(+), 67 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

