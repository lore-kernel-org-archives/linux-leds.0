Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE2553978E;
	Tue, 22 Sep 2026 11:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075663; cv=none; b=JFRIC37FPWd2sjechVZJBovyjwEv6dztceNoSRPv3gIeqt5/BoJTWW7jELL7ZwvRaBLe2/9Qswwe9cHt6yYR8L9SDR/6StZX2D6Fm2VUpGIxSH5Fq0WQ0eCD6qub8vKOzXfIo7pQKo1WUIIiYonnTXluCsyCb8KAhS3Vt43BP18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075663; c=relaxed/simple;
	bh=f5B00X9L3mbBPXrFWsjHvyP79Cr1HnrdI3TmFdo0Ab8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDMQhdtoVBvrd/bcupHpsTkdrS/VU4GgRnjMQZPdTqeIsHl0OkRLvDLmILI7uTNR2BqlIcUtnn58IcfxAY5Ngay6Zb710W/avQ5xW+u79Ax8Gk6uvQX52JcpSXu8DejCCmcpXHqq3zefuinY4KbV8Hn6J0LIV1LZjLfEptEalqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHral7RN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHral7RN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06761F000FF;
	Tue, 22 Sep 2026 11:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790075661;
	bh=GSoaR0jttradGlf4vTta+ePgcvYxcne8jQ6IVHhlS+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nHral7RNQ875LKn3EV8MOqUwuWFvs3X8qDkhO9r7nlNspaJ/22NKL7Tes2PrNILAF
	 N+OgRdMx/bpJpKqOZ9D7JRHe32LANmwSk03gt3WUreZ+6am4Qe41hm45D1QUqSLFhp
	 ooxvft2L+VVqeO7absx3VuyaKssnX196Qz8xWklORVOeFRTEUgHQvQ759yJvzbuzQj
	 zxMDOFGPfcLcPQP9BC+lHQsomdHKs4GRBkyN5zxOzc59G8oIfEgMX1znUbJcxoC/OR
	 6PhLg0tVL8oj5dAP1shaykrDLOLwo/zmAh5DsVQrSHM0GPH0FwA2zgqeYXf0IfdQHO
	 Cho4MB+TwYjIg==
Date: Tue, 22 Sep 2026 12:14:17 +0100
From: Lee Jones <lee@kernel.org>
To: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v13 0/2] Add support for LTC3208 multi-display driver
Message-ID: <20260922111417.GA3277918@google.com>
References: <20260911-upstream-ltc3208-v13-0-fc9aa3758b55@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-upstream-ltc3208-v13-0-fc9aa3758b55@analog.com>

On Fri, 11 Sep 2026, Jan Carlo Roleda wrote:

> The LTC3208 is a multi-display LED driver, using a high-efficiency, low
> noise charge pump to provide power to 5 channels (MAIN, SUB, RGB, CAM,
> AUX). Current for each LED is controlled by the I2C serial interface.
> Four AUX current sources can be independently assigned via the I2C port
> to the CAM, SUB, MAIN, or AUX DAC controlled displays
> 
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>

I don't think you're based off of the correct tree.

Looks like you have patches in your base that aren't in the LEDs tree.

Please rebase and send as a [RESEND].

-- 
Lee Jones
