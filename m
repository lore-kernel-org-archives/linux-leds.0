Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D6F3CB2FA
	for <linux-leds@vger.kernel.org>; Thu,  5 Mar 2026 17:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772730142; cv=none; b=GqGBscc9Al+iqzveHzP8gZ2WMrQUmU5Sg3bVZ6LLcoORNlAjmVBPCz+V7SnwhnmwNw8v7hr3XbHEr/fB7yzr5AJML848g5KIAKW5zktkvJTrL0g6ttMnKT6hru57p08Vqfhc8WoEMLaQZBDigrIyLoNHjXEe+p1Xc/HT7Myoi0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772730142; c=relaxed/simple;
	bh=KZ5JBTEMvrwcsJ8djLfnOIxh+RoZq+jMyLeliqTXwFs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NuU51n2plcclzEKkCS7KcWgzz2FdGJ7m0JhkzsM2QHhm8RJ6MUjzpLe1jnJiaGmSs9mBnFiQOyj/1zDAHZcVp3H0tP7Qs4VUt6g5ldi5irwTL4YT7TPKEQ/2jeW3CJths1zoOoKKF/uuHCcZdWiXz622nAdPhPrV4TmfPxVPM+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTES/U+h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTES/U+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA0CC116C6;
	Thu,  5 Mar 2026 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772730142;
	bh=KZ5JBTEMvrwcsJ8djLfnOIxh+RoZq+jMyLeliqTXwFs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kTES/U+hzUGnGg9NfUhVbMDhINdxuvUaXkgQXpA/aO8ph6kHcLOI/gtCmT7jWmGkL
	 b7GtKY1L2ULf/HzvRg7XJ37NHUJo4D6L/Pekwc2HrtQdbgrxGpw4D4lyPc0hMM82yo
	 inqXqcRgzR4tCFzSN6yqrB2ZPsed+1zlSo/2dLEcV6bqH3FFC5sMXlbNredVrgsxs9
	 /dLN3Lev1oSnO4YTRqydy1h7pZtpqePD0EkRZGTT4hrVohzoNgRIsoC3xKc4bHvx15
	 J44wWRVRv12nQxJiXDNVdDkwyCOt0Y6bsq0KRg+M76/WswOBZcmd/ubGcuX2Q+vqLZ
	 e2Zpoo0EpdS+A==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>
Cc: linux-leds@vger.kernel.org, kernel@pengutronix.de
In-Reply-To: <20260206-leds-multicolor-fix-signedness-error-v1-1-48a00ed33c07@pengutronix.de>
References: <20260206-leds-multicolor-fix-signedness-error-v1-1-48a00ed33c07@pengutronix.de>
Subject: Re: (subset) [PATCH] leds: multicolor: change intensity_value to
 unsigned int
Message-Id: <177273014112.321702.15159156714467402540.b4-ty@kernel.org>
Date: Thu, 05 Mar 2026 17:02:21 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Fri, 06 Feb 2026 15:21:23 +0100, Michael Tretter wrote:
> Using min to compare the intensity_value with led_dev->max_brightness
> causes a signedness error:
> 
> 	drivers/leds/led-class-multicolor.c: In function 'multi_intensity_store':
> 	././include/linux/compiler_types.h:630:45: error: call to '__compiletime_assert_195' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
> 
> Change the type of intensity_value to unsigned int to fix the signedness
> error.
> 
> [...]

Applied, thanks!

[1/1] leds: multicolor: change intensity_value to unsigned int
      commit: 2c490329e3a3ab896cb08eb34a0dbf254cf11e9e

--
Lee Jones [李琼斯]

