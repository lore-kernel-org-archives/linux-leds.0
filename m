Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCCF370D51
	for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920028; cv=none; b=T2hB5yBwJ9eeYGUyA7CE2eZtg/Z1aIh4TnuABqLG3PwIJEj6rxxf54U+lPBKE961RKFyH0YtVEKGjHHZ2xlWE3Ch+vZk43wzOKfFesWlL1hkXQx3wJCM0wnZwEiHdrNbUktCfpH7NZfdUDeY6b6MzjTbRrzwYutzw+V0KOfgaqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920028; c=relaxed/simple;
	bh=X4I83R/qGfMak1Bp5dMxOSZFKJKYZ2k33jM4tuXeTV8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=li3shmg+ShMvz9iVB6SMKIYnbLY1lVuh0ryaXCGRJ3EyMRtlv8bUYhvWDEhKZLYVxsiy/q2PHdmDHDwSaW1c/OWN8XVTYECgiVqtIUn7xkAN54VIrx1OfYq4IoWQSqIrKEBOlHan+NYKtVJOLqWuNJX9c39tTLVt6tqb9Q2rRuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqpjthQi; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqpjthQi"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ad4d639db3so3699925ad.0
        for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 04:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773920025; x=1774524825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLYfM21/zzEVCEaZe4SF2trtxe912wst3hPauAS7zAY=;
        b=PqpjthQiBrdOzJBoESfx3FljpZv4Hf0ts4QsuSJLg+Vipn88tzSCKALuyXRY4+Mfp6
         CDBVPiudtvT1H6rm2uI1vM+yF3hgaDlVYTqG33fDDFpL0NbF1Igm1oV43f8vs8RR0+Fj
         vbfTJdo54ambswyrkOrKjb8F0r5sSxxH3O9JdVI1mtXpySTKggu7PRnvhfDCDsFzdn+b
         V9ySxnTJuYvV9aIU7us9SE0OJ6ABHpIi9zj7C3zBcCS+khogvtf8v8iPadYrbCeVDs/s
         a2d6DwHweTAU+QioVOzn3RMs2dBxSBga/cdkR75XhUCFVehMhrADHOJ0WmkhL9xFdoXy
         23lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920025; x=1774524825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zLYfM21/zzEVCEaZe4SF2trtxe912wst3hPauAS7zAY=;
        b=S5QAfQsT9ndH3Eyj8N6V7QFPJR/RVVVf5bMg+cUrN09PfjPLMC8bMhfOAn7VddMWUh
         uSgILWa5trmAybrneZLlgodYQn21Z7GtRAa0jx/ru+nMehCmXTwpGwr4RBTov7F73nEo
         BgKT+DCje2svLidzTf0GrdhLuoCJ94nr1fXk3EJow6Og0n9+bU1jptUDfjRyOISnIT6+
         oH6FoRM1Jh2v2LVhY2JmLmwEwZ3kOngv4vuZITELoprfB+dWwz0iQlDeW93yAofx9OWm
         RqCJxvJIIrvkC75eHR+98Q6v2UznE4oS20713l/w+sAlrrHVdecE3pYnqG3K9efRuAEk
         ETCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ssor48sI/FLjt/uIrvPUw7N9Yd2OJ5S6FF5fMdZBTjDdACycaaHcbWp+U/x6TWMaT4KFPE0lk6hs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoj/2kcuBoMxG8v11dmqKvVI53XY1Q7LX8D5BWAfJ4SkZp/KSC
	YdKB7E0CXk+bxz+4l/A+y9qS9DG7y9eruNA8Uzy7C3E1V0SOUJBFyJy7
X-Gm-Gg: ATEYQzxP9r9amS8HvghoavPzS5qm15PhYJsHf79HPHl7pPaxZOMcVenJFwbj3lUxQBP
	IP+2bjhsGwakCKvfkf3xxwipBFSMFZL1Epqgsp1VemCdVeWlt0vDV1oOrVRPOEUdlYbLDwYbE9O
	3MBVHwdNPHwyaGme6m1AJCmOYxq/YkFsFsXvx8jDfkzWWJFoZe7T4vIn7PHQ3nr1nugXng+BvI1
	95EgoWKVGAQHh05vJL6pLU+tHPcfUEkJGt96OEDvPkSo52Bim+NAhKNdDfiKf9zH5eK0la49svh
	RWFcckk6lgM3SA8Epzv6547Yye2OakFYIwvfdHq5LZofCpUUBkmPB0MBd7S9gOvN2I2hy2HItVb
	vvKYNCYRNxXGPdyODmrv1Hh+XOusDqpd+IncRj1vvqnd9806HNLhPRaKPMFjP28vgm9BUXuE0la
	xKyfft3gShZNifHQWbvBUoeAXLZQ9b0mTPS0pevEqodooyb+s3V92gYA==
X-Received: by 2002:a17:903:1986:b0:2b0:6961:150a with SMTP id d9443c01a7336-2b06e3c58d9mr72979375ad.38.1773920024609;
        Thu, 19 Mar 2026 04:33:44 -0700 (PDT)
Received: from openwrt-virtual-machine ([202.63.77.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e63b294sm75032055ad.84.2026.03.19.04.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:33:44 -0700 (PDT)
Date: Thu, 19 Mar 2026 22:33:35 +1100
From: Bevan Weiss <bevan.weiss@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] leds: syscon: Add tristate option
Message-ID: <20260319223335.5e1913a4@openwrt-virtual-machine>
In-Reply-To: <20260319101327.GH554736@google.com>
References: <20260308015824.2318366-1-bevan.weiss@gmail.com>
	<20260308015824.2318366-2-bevan.weiss@gmail.com>
	<20260319101327.GH554736@google.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Mar 2026 10:13:27 +0000
Lee Jones <lee@kernel.org> wrote:

> > Additional changes:
> > - (int)(struct platform_device *pdev) => void return  
> 
> Please rephrase into a human parseable sentence.

Thanks, will do.

> > +	led_classdev_unregister(&sled->cdev);  
> 
> The driver uses devm_led_classdev_register() in probe, which
> automatically handles unregistering the LED class device when the
> driver is detached. Calling it here manually will result in a
> double-unregister.

My oversight, will fix.

> > +	/* Turn it off */  
> 
> Turn what off?
> 
> > +	regmap_update_bits(sled->map, sled->offset, sled->mask,
> > 0);  
> 
> If 0 was defined, as it should be, then you can drop the comment.

This is carry over from the original source, when it was originally
modularised.  I'll update the comment to explicitly mention that it's
the LED which is turned off on module remove.

> > +MODULE_LICENSE("GPL");  
> 
> The MODULE_LICENSE() string should match the SPDX identifier at the
> top of the file.
> 

Sorry, I'm not quite understanding this in the context of other files.
Most modules within the led subsystem seem to have 
'GPL-2.0-or-later' as the SPDX identifier, and MODULE_LICENSE("GPL"),
as I currently have here.
Is there a different subtlety I'm missing?
e.g. leds-adp5520.c, leds-as3668.c, leds-blinkm.c
Perhaps MODULE_LICENSE("GPL v2+")? although I don't see similar
anywhere in the kernel.
I'd expect MODULE_LICENSE("GPL v2") to be for 'GPL-2.0-only' licenses.


Thanks and regards,
Bevan Weiss
