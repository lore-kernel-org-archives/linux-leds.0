Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AFC3C9881;
	Thu, 14 May 2026 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760256; cv=none; b=hdEKPVlelAapoCoT3tT78nHd6Pa+TOf6qirXwVnxHGIDNG1rF+F8JK+AYz56/GWUUPvwrTV4ZD+4cMHcxSACwI/sB4TcHyGJ8CbG3iZMI5YsEe0o0QwLPurjBMThQdbpKJOnrRfuiNDegirCcKHgYRbpGthpRsqxvXUuaEFHg4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760256; c=relaxed/simple;
	bh=ilGjJz+XfoQ1tKGGm492j7XhI9LTr5QHqJWMceMiQ60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DJPxoVpxsaAt8R2l8I+OXQ11RWCm3Bvxo2Dbj3lcbIzLcZ+NaH+jkDREzeMGa7cUAJrwDfB8Twk0pxcleopDIS3gsi7avL5sh3x0wlHJ9B2IEtZn/kyogEKFJNs1chEp2Y+I/SwEr+dppSx10VeSJQLndX2+K6cn3P/7tfDshQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4pjVtTU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4pjVtTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95490C2BCB8;
	Thu, 14 May 2026 12:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778760256;
	bh=ilGjJz+XfoQ1tKGGm492j7XhI9LTr5QHqJWMceMiQ60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M4pjVtTUGEzxZKNaNNyYg+MeJchhlrDmwnGLK0rVMk5zp+f7yR3NFDVzFwUYt/3Us
	 eM4QsQR5vgw6+S3IQoAqCm0oZTSBbMsZLoBsiBQ9LCLgF5ExLSKmBVmm23W2PN1bXc
	 9kl3Zf+BijqDAsZ1e8XACiYvD0+Qr8iF76/jfY/JeOxjq3S+G/uXzcNFWBqesS3oNk
	 AIIPICWJGWcVa/8/RPwGRT5yr0MbEh9ynH9pYhrn/x8Tnjdf6G8uhDA1hUyCh85acK
	 rb+M+ofcfdHL0/FBsB0oYyv0+4DsOw2cwcG3U0d3PJJt1Aa3vjx8GgMHLmJFDMGrN7
	 S12Ym3F+5RnWw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Rishit Bansal <rishitbansal0@gmail.com>, 
 Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>, 
 Edip Hazuri <edip@medip.dev>, 
 =?utf-8?q?Mustafa_Ek=C5=9Fi?= <mustafa.eskieksi@gmail.com>, 
 Xavier Bestel <xav@bes.tel>, linux-doc@vger.kernel.org, 
 linux-leds@vger.kernel.org, Kate Hsuan <hpa@redhat.com>
In-Reply-To: <20260504145434.12746-1-johannes.goede@oss.qualcomm.com>
References: <20260504145434.12746-1-johannes.goede@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2] Documentation: leds: leds-class: Document
 keyboard backlight LED class naming
Message-Id: <177876025332.2685640.12997401714935316601.b4-ty@b4>
Date: Thu, 14 May 2026 13:04:13 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 04 May 2026 16:54:34 +0200, Hans de Goede wrote:
> Document the existing practice of always using 'kbd_backlight' for
> the function part of LED class device names for LED class devices which
> control single-zone keyboard backlights.
> 
> Also extend this existing practice with a new naming scheme for keyboards
> with zoned backlight control. There are several drivers in the works (see
> the Link:tags below) which offer backlight control for keyboards where
> the keyboard backlight is divided in a limited number of zones, e.g.
> "main", "cursor" and "numpad" zones.
> 
> [...]

Applied, thanks!

[1/1] Documentation: leds: leds-class: Document keyboard backlight LED class naming
      commit: cd628658d428e8a5074b9608771be45d86770bb6

--
Lee Jones [李琼斯]

