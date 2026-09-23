Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA112456299;
	Wed, 23 Sep 2026 07:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149130; cv=none; b=ZdP20/yAnUjuZN6KG6msYOweiCxjy9No8BBomPIAI9fkbbr0121avYLH5d48zfbLa5WUlYuydg6UaZpuPcr2T2JsZaxkYTO8Bvv4o77tZs0E/JijukUa74rTl7k84SUmlZQT7LUXMAJ97GIE9Q+Zn42WEHzaPIZb8JlM4FJom00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149130; c=relaxed/simple;
	bh=9jJI5YdKn0qZGNqkW4g1Bm1cE7u70g2MEtrx1mWRe+s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TrwwmnKhowEZQpUiLb5MXzLpSuqHjuJIpnRqE73zeBsSIECT16zQdDWO1hvD8/DtBGaavKrklPB2zTi3mAQ/0cJ7FHLrGd9TdM9juwo7ZNs+i6VTg0fGY8T39QiB/kpqGluY0obUnIdrXVeamQrIdve5B1SeEaGlGvezMo8oXdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4K82lnL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4K82lnL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B4B1F00893;
	Wed, 23 Sep 2026 07:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790149127;
	bh=3YQeWov3npXTOH4FVK7TExNNBso/0yZtUucS+ZCJOIk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e4K82lnLCt3yMABnwKlbqaltGjlmf46J/t0vLNGrMLtsZsC1ES84bP3r9xSvi2qaj
	 D0GMoYTfA5CALjth5za+jAT4rWXVkqnAR/mPUeIHKKFENMt3rwqDLCSLatBrIqyXuC
	 r3YMjerosb6qvH+lyPgAuU12nQ5tUVXWi3jiV7QVt3gnUaLqrzo/pX+6avfRy+bdeZ
	 EpOWLjQJKSWt5gZ1WqgwskVvWgMivkLQWgl1gukmDjIHa1XXb/fVcgKCmWJxkWZsQ4
	 LnmhJ5neTPw2NcjO6IFrt8ExAzAed8n0RVsdKOHPwqNA4PuJIPuwhhM6jkbk02kVLj
	 J9uyyGKAvecAg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jan Carlo Roleda <jancarlo.roleda@analog.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260923003325.61722-1-jancarlo.roleda@analog.com>
References: <20260923003325.61722-1-jancarlo.roleda@analog.com>
Subject: Re: [PATCH RESEND v13 0/2] leds: Add LTC3208 Multidisplay LED
 driver
Message-Id: <179014912595.3812484.11815634960221822881.b4-ty@b4>
Date: Wed, 23 Sep 2026 08:38:45 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 23 Sep 2026 08:33:22 +0800, Jan Carlo Roleda wrote:
> The LTC3208 is a multi-display LED driver, using a high-efficiency, low
> noise charge pump to provide power to 5 channels (MAIN, SUB, RGB, CAM,
> AUX). Current for each LED is controlled by the I2C serial interface.
> Four AUX current sources can be independently assigned via the I2C port
> to the CAM, SUB, MAIN, or AUX DAC controlled displays.
> 
> RESEND v13: rebased onto leds/for-leds-next to resolve missing patches.
> Resending as requested.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: leds: Document LTC3208 Multidisplay LED Driver
      commit: 6db5536b3bb71ab303fe7e9b95d77a09702c24a3
[2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay LED Driver
      commit: 83858f2b93922e1a6ddb77ed76b18711950f8b0d

--
Lee Jones [李琼斯]

