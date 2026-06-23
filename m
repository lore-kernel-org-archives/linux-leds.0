Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC8E3D3CFF
	for <linux-leds@vger.kernel.org>; Tue, 23 Jun 2026 11:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214881; cv=none; b=lTbTsQ9rpnzhR7ezvX8mfPlzKWDkryophQItGBITTwagNVdnBWZCBw0Q0+ZjACQeVEyhkySU/t3sqfHqSm9uwlJlP8ez7UYJFUmKqcPHTftK3ZzruJ6zRlOa9Tb7+Rdn0Sk76ztuSMZR90WRXtNv2MVSumlYOO/ZVxqWgUx5sW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214881; c=relaxed/simple;
	bh=tVCetBsdG4d8Os3a0w62LGVEUED/BfzGfIpqXKQhEPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svYlYcU5zxYjiXx1eLiEK1uaFGPel3lZE9lvOwLWG5nXZXUHTdmgkFI3jEgteORuNUi0PiJmtZ/YivpYcZQ8MW1cAaD8miNOA6g5KYQRMV7lENr+/bb3aETIwTW/1S1abr0NefelqBD2gFx/jdDgHbk/hc+xTeAyfwO0bgPhhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=APUK+8ci; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="APUK+8ci"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4629051c946so656369f8f.1
        for <linux-leds@vger.kernel.org>; Tue, 23 Jun 2026 04:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1782214879; x=1782819679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lOYI9zsM4oIZ1rh6HmaZ/ht7QHKafqKi5GGpopSOq5s=;
        b=APUK+8cisIGYaVecqfYbVrl+12sNPrUaP7BFuE1DZp1PlPtTytQ8yV9qlYDD9kcQ6B
         iCNaaLJMYUUICa3/xV4euCMB5ESgBogTQAP9l1Z6dpXryea8acq9XWQKazPwu5TuClM3
         H2QWDZhywIvtS3THfH+dTGHaNB2SOv7/nRmBrE0HIAqAU2mmo5GHqMbwDgtbgAY16mqw
         4zUZno4jyYapCnfrPfsStZh8WrARGxiHBG0k5tXLSaBQDd5RFZL0I93jAHTNjUtMY3nB
         bZFjv7EWKk+HM/rqmSpmXyo1djYjbP11x+OvARyhwDh9hw/zWthXAGc5C0QK+E8xMl3B
         HkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214879; x=1782819679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOYI9zsM4oIZ1rh6HmaZ/ht7QHKafqKi5GGpopSOq5s=;
        b=i3pKfh+5wL6c7c333HKHqpk5/dV2LxvmwTaTkBgn9F1FCcjM7b/rFBFh3m9aELBc3B
         cilcWxHn+UrYLc+8HiIYY5jc9D/v6qw3yYBacV4hntV4MPGOTq1NewS3Yq5oqTfuZoRX
         wUeGtzj5efPcvYYI08qyrhijgE6twQxB5TS20aH97TZUTADRPYPEZqkjjjyyPVf+4c5L
         wzY3qrzBpELEXUwcvuH/7xQm0CxmgnE3GTBWPk4rXxgsoy1v+7q6pCZrbRCihKdLwjC+
         2qq2bD9c+f4j2Vwltgv4fNnr09xchzymm9RwC9FaA9CzlKqvTy8onmiYpWUbH10aRguD
         DLeQ==
X-Gm-Message-State: AOJu0YyPCWkLmaF1BEj+uMFWl5jjm7wR6QjIUisPDjxHXpdDrlT65VOP
	bu1uzBPuezJT/tFQDQ+RpfnzHQxZCPjRjG5e4Mzaud7zaeHuG1V397xfVERRW8nB7Os=
X-Gm-Gg: AfdE7ckNSO5V90CFJt2uoDpC4JVqZfFIOsikwdMu4NP8l0D3/qfUgPC1BXSQOoWgEto
	+XZcZiYNxD02ybknOw/DRAXaLY/kKz8MmQk/X0zjNsDRl/2pl3txQrwwn29WAaTICB3pp9K0j7n
	TuHw+iEdWhr4WueigPUcF8OiASFfuKkMmsPbwJcNhHntEefl4mxUwT5XLzhE6c6bDC2kpl1OOPd
	Wwhobf0eb8Yna/zThrhu5VEfYBTsL8SSzU9A6j1kJyZrqEDnMgT7toVsrcyATvUWiEV3VHAgH3L
	41XOupA/A9yEW2iuBjsF+lYmk8aStc+t7YcDU8+SW66SruaMvQkdOu/Mqz8Z8Lf+ZoUauzDHgRQ
	uLBj/0lEzWi9f7pnc5eNdwf0TIA51Ee203eg9rTEaGE8r7CavYgkdOzd2go5ZEeZXAtqt/4PsMl
	I1KCpyO33Tl92Vg68Qjfeum9E+O9uF0RZRGqUKEu364uPH6t+KKJrNIN5NBfoJMmht7MfyXSRon
	7AfPyW0beXeJCzTLiUWAjDBhM52N1sQBYVx4wKJXLwisQH4Vj/ZMFxPbcj6q3FV9bPCldaegg==
X-Received: by 2002:a05:6000:38c:b0:45d:4c30:81a6 with SMTP id ffacd0b85a97d-46a7f0ac242mr5028245f8f.5.1782214874182;
        Tue, 23 Jun 2026 04:41:14 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666678828dsm34329541f8f.19.2026.06.23.04.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:41:13 -0700 (PDT)
Date: Tue, 23 Jun 2026 12:41:11 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"afd@ti.com" <afd@ti.com>,
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	"pavel@kernel.org" <pavel@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"danielt@kernel.org" <danielt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"deller@gmx.de" <deller@gmx.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/3] backlight: lp8864: Convert from LED to backlight
 class driver
Message-ID: <ajpw1w150SXm8Gbi@aspen.lan>
References: <20260615120353.3409035-1-alexander.sverdlin@siemens.com>
 <20260615120353.3409035-4-alexander.sverdlin@siemens.com>
 <0b39450b-559b-43d4-a1e9-bb6684691cb5@ti.com>
 <acb13aca040ab72b9e53abee3a5c8733ebc5b8dd.camel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acb13aca040ab72b9e53abee3a5c8733ebc5b8dd.camel@siemens.com>

On Tue, Jun 16, 2026 at 07:17:23AM +0000, Sverdlin, Alexander wrote:
> Hi Andrew!
> 
> On Mon, 2026-06-15 at 14:51 -0500, Andrew Davis wrote:
> > > Move the TI LP8864/LP8866 driver from drivers/leds/ to
> > > drivers/video/backlight/
> > 
> > Why move it? You can register a backlight device from any directory.
> 
> I'm personally fine with the driver residing in drivers/leds, it's
> just that currently there are no combined drivers there, the combined
> drivers providing both interfaces only live in video/backlight.
> 
> But if it's OK from the maintainers' perspective, it will be even
> more consistent regarding Kconfig symbol.
> 
> > > and convert it to register a backlight class
> > > device as its primary interface.
> > > 
> > 
> > What do you mean by "primary"? You should be able to register with
> > both frameworks and have the driver interop between as needed.
> 
> Well, I only meant the user's (or my own) perspective, sorry for confusion.
> 
> > > The motivation is a use case on a hot-pluggable segment of an I2C bus.
> > > The generic led-backlight driver (drivers/video/backlight/led_bl.c) is a
> > > platform driver and as such inherently non-hotpluggable.
> > 
> > That isn't strictly true, there is platform_device_{del,unregister}(), so
> > whatever your mechanism for removing the I2C device would be, the same
> > could be done to the led_bl device before then removing the I2C device.
> 
> led_bl is not really designed to act on dynamically instantiated devices,
> it's very much device-tree affine (of_count_phandle_with_args(), etc...)
> 
> > We don't want to have to move every LED driver that could possibly
> > be used as a backlight to the backlight framework, the led_bl.c
> > handles adapting LED->backlight as needed. So what you really need
> > here is to de-couple led_bl.c from DT so it can better handle dynamic
> > add/remove. Then this LED driver simply could register a "led-backlight"
> > platform driver to handle the backlight interface, and remove the
> > backlight device when it itself (the LED device) is removed.
> 
> The mechanism we have regarding hot plugging currently is just I2C bridge,
> which de-registers and registers the bridged bus. So no additional drivers
> are required, as long as I2C devices are self-contained and not glued with
> platform devices.
> 
> So bottom line is, I'd prefer to just add the backlight interface to the
> existing driver, no matter where it would live in the future.

Is there any reasion that LP8864/LP8866 is unique in appearing on a 
hotplugged I2C bus? In other words if support for dynamism is added
specifically to leds-lp8864.c rather than in led_bl.c then what will stop
the same dynamic tricks from being adde to other LED drivers?


Daniel.
