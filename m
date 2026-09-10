Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D21E531B0B
	for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 16:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059402; cv=pass; b=tc2bkMnKeqGU6d7v4O2VMpfCDrfwVnc5IE77R27etk0WNgSoVemHLDYPPeZEIxSSKSOICZgHbFRMr1GtjhIBqTfIpP65AqL3lBpJwPXQ70YZtpggTMLhRUGtt6YEFrzAD2Jf47atjG62z73TT4OwATywxNFr+PpdTG+5i2KGkbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059402; c=relaxed/simple;
	bh=48Yr0M4+GbTCNRGs0VANx8sdxOokODBxtI9C37mhqVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=khqwnrctFaH7n1HKTSgTt0e4Er0n4SyiALnr1H0vMPBJbPNG3BNSTV/751gxKeMHLnRCwtMXNE3Ar2fj1t5L1ynVmZrorivKiS/iTWQHtkl+3vP/+jes/crcy++9o8sgVRkquXPb42wh/XjKz+HTkDcDHPLbUw2O3SvabvIBsOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxY3U167; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxY3U167"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso1197600e87.1
        for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 09:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789059397; cv=none;
        d=google.com; s=arc-20260327;
        b=O9IAOeK1BWXVK59/gZLXwl8LySa40iLNbpA64TMcb0YH4YWezxQkJ+f50wtRRlFHWk
         Zws2XenZ2hwkJQbjpgMbsI2d5rPU3JTE4TztHeYt0TutbSnneMj2Clsrb3ocngLcV2rI
         aeAk6wmOQdBKYAEqpPUXtn7/IRcf3DqWGRIOJbiAf/ejsmhpWn+VkLgwl6GiLnBAZCOn
         b+Ibmo9jCl30BOvzZSsEk5MqLqaJ0SHBeuDOPy62vWjtPVCiirzbl2yGBPzWnO80O0RO
         i9/HzjMXeCtfDvMQ7TYyLSTXVgx2KpGU1PSKypKfvBuCwIBWBm0a6W6o0PnMJ2SI7Ryu
         hI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=48Yr0M4+GbTCNRGs0VANx8sdxOokODBxtI9C37mhqVU=;
        fh=uk+0/tDePI69jZwj0wlw0Wr00U94BATZtNHm/P5DVCg=;
        b=LlZDazV9/oU+EaaHsVl5h2H/taJ58E6zRpf+s2i0ATi+q5nToCmRkwK8x1ojvX7TXx
         cdX6hmdeZl/QXTVYYled7r7W0abJfUKEU9oPWPqrpQVZJVjp6RfmRhHuRgtCzL703LeG
         XP8lyyocD6anFsqoh+TnsCDYECGLpCKw2fJSmgPb0GrinpEYwznLwhnqFcd/Pd8kCMnO
         24LDHNUogZ8G0SMWiesE0+xVWLr1nxmTcAzE6icbzUc8dolLmoV/SlhZCbPUjyVmyjQU
         XIxXOzRAW2UVKh/mouxDWW8k9mU6C3qKOqUEiYeFu4bpYgT6eXD0pt6riLHJksnNgyDB
         Vz5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059397; x=1789664197; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48Yr0M4+GbTCNRGs0VANx8sdxOokODBxtI9C37mhqVU=;
        b=dxY3U167tw3Blu1zgBWr4m3yTDj1d9H2F5/4ohkb8wBPvrQpgpAbv3rClChx7vM2Mc
         IdFbrf/0iEw2qgxwX8h5mRZssd3hJ/cuG20fVRJ7L1CmBjkhl4YYfIuEJo7z7eCGipHO
         iPUFTrPRtE5lskd0wg8UUSCzZinHgPl5r9eOUCNDNifPykNivRGFet4vXBOyHRuDsmYK
         +7H+Vr5UYoPD8JGFg/Kr6C2qgIpsOqXR1/1agOe12a4ELBgePEB9aT1lazw9Y+OQqO1/
         GmQHcSOaHZ5VdJ75d05TDBx3BTttil1MALWHpQdKNh6rCUxAAWB+OZ6OJOUNeFFaqqxA
         o6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059397; x=1789664197;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=48Yr0M4+GbTCNRGs0VANx8sdxOokODBxtI9C37mhqVU=;
        b=qAokdLnRVa0bkL+OqD1OCz6zOnT4lxLx3Yhk9/pYKeqEVtn8tH11q/E0XmdP7bGqZB
         1xatnqd8h5KktijGuVATUce7e48hsjbhvAEQatbLRgFNE9uAHFHBNdqNenfuDs144/Wz
         luMbhEVRLv0Tqs1N/LjT3bi4hiFcG4Z9nX+CJGJbee+Mq7MRtNoxXkZGleJ6A0qBeaxg
         +EKhMDAhqhM8seTE4M8444uiTsjHwOEdHe5R+zbC3VI+2m181CnZXQPPUEosJC/4gUtB
         unwxwdYCet7LZ/2cf7Dj1AYEgH74CsKpFsO0gj39ym3RdLS7YtnLIv0IhSzaljK8W4uu
         AL1g==
X-Forwarded-Encrypted: i=1; AKwUvBxx27+3obDeg15sFxsuXUKtxYbErL1kYvj6J6kyK/8CcV3/FpmhH4kNXLdQr7f5oFdL8O/xCxl8nCTx@vger.kernel.org
X-Gm-Message-State: AFuF++kHXiBr/KC9Cp9UX7iVMkJRAM1RI2GrKfg2Qkvp11AlIFjNDMLf
	3LwsqWH1lC7+d/nirqlvvsZCzF0tZBMlAmB44L2RhKu4oPNPf78nCAeOQ8A0tRBb+U2idEcCi6Y
	Au5DZ/SVpI+o/szxiqoh90kzodIl/KjA=
X-Gm-Gg: AYBFou0d2lphyt6+ae5h1BZnkXQMLw7LsL25sJMMzSTrrANEkX1VhbNCxWGn/wUSY1e
	M7ooTCQ00kJw5XIz3dxaJwh0dlJr6Zl+EJ8NXJ4f3USQjVYQsMkQ7CMLne63iAZolA4A01IezNs
	eH+KIkc3rgMW/vl150ObkzL1yym0BPW3R6Tn/SAbDGYntWFWHEiLHZ51uAUBVMlQFZbSJrZp1qG
	QRhN4rF+8K4FGfBiF/DbmLmaeh3SZY6Tfhhfk0L4XXXnhkKzq3qCJlFlhpWa4TwuA+Et/82ceiB
	0eXGvNsD9hfkcZ1XCx+TSzm1LlJOmKWvmaYLfjOSYFYj1ardSYo68qv7Bb+BiFM4u8XB/IdlTb8
	oR0CH0/3sZ1bQmjCHGO8jddpKYpzXoEsSvqaZRUZkvx+90cie
X-Received: by 2002:a05:6512:a92:b0:5b6:1aee:95f7 with SMTP id
 2adb3069b0e04-5b89a37bf4cmr1102365e87.43.1789059396760; Thu, 10 Sep 2026
 09:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787502624.git.ahmadexp@gmail.com> <f04b85bbf71a09f372b1f248dbd2b1286a0ba903.1787502624.git.ahmadexp@gmail.com>
 <20260910123528.GA1051768@google.com>
In-Reply-To: <20260910123528.GA1051768@google.com>
From: Ahmad Byagowi <ahmadexp@gmail.com>
Date: Thu, 10 Sep 2026 09:56:25 -0700
X-Gm-Features: AcwNN1WQJyaMmPXUVD3vdCAdJhASvoUrxNU6PY-XwXiL3uKfg05bB7LcJcmHdc4
Message-ID: <CAOQiBWM_506kwk5Pg5HwBhHObtpWN2C0e+OducwfF6ER7ouh0g@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] leds: is32fl3207: Add controller driver
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nam Tran <trannamatk@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Lee,

Thanks for the detailed review. I will address the cleanup points in v8:
remove the redundant led_cdev pointer, populate brightness directly in
the class device, use chip consistently, use loop-local indices, and
fix the wrapping, alignment, braces, and spacing. I will also name the
current-scaling factors and the two PWM bytes per channel, and explain
the output-disable fallback when the initial PWM latch fails.

I will drop the unsupported-property list for multicolor components.
The binding already disallows those properties on component nodes; I
will clarify that brightness, default state, and shutdown retention
belong to the group.

> Is it even architecturally possible to set brightness on a shutdown or
> disabled LED? That sounds like a bigger problem.

The guard is intended for system shutdown, rather than normal LED
unregistration. In the current LED tree, led_classdev_unregister() stops
software blinking and flushes set_brightness_work. The system shutdown
path does not call that function, and i2c_device_shutdown() calls the
driver's shutdown callback without draining LED brightness work.

A previously queued brightness callback can therefore run after our
shutdown callback. Both paths take the same controller mutex; setting
shutting_down under that lock prevents a later callback from writing
registers or changing the final retained state. This also matters when
some LEDs retain their state and the controller must remain enabled.

I will retain the guard and add a comment explaining that distinction.
This is based on inspection of the shutdown and LED-core paths, not a
hardware reproduction of the race.

Regards,
Ahmad
