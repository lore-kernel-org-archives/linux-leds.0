Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C493E0C59
	for <linux-leds@vger.kernel.org>; Tue, 25 Aug 2026 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649327; cv=none; b=CCh1tK7PVmiWqHSdUwzYb7AO8YwMc0KtDuzMoH5DXks/w9FxVarv83gTy0RRvW82D1PdW8XkBv6BYldW06nuq03yBujPFDK5NAH/KWleWrugNK8f+7JMOcGI7vFFam6BvuyPwX2VQBsxU4OKBBtZvJjwmRFElfc8pn8etSw80lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649327; c=relaxed/simple;
	bh=KQG7I15zl1cZ8xoz0nJUhoyELZuli5z85AXKE7Cy0D4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLGy4+ehSimKPNE6DXzwhsHb2K2YEPHF7VSEGLfiMWgOk7AJbg+XXIad3vbB570mrJVYfM4blU6o1UfeNFT/3duZuf/OAXRCXtaINfFmX+Yj4LJNdK/gciElAzexR6mU1nsxamPAS6VaLIgcISRXI7q+ccTw1wkThARbANnQyLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=R5ZLpaM7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="R5ZLpaM7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4998590d392so18762555e9.0
        for <linux-leds@vger.kernel.org>; Tue, 25 Aug 2026 02:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1787649324; x=1788254124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KQG7I15zl1cZ8xoz0nJUhoyELZuli5z85AXKE7Cy0D4=;
        b=R5ZLpaM70CU5oOvUDOWx3aSdVWl4WCG+c7HRNIiEwUnuZRPGb5Gi8n6St7HQtbUvjZ
         wPaLuGtd/LikNUsxHKAVYOuiC5CxGqU+moyqk71GO5z49bKCmNtBfxRYuJdUVevU0sKA
         6QJSTBexzISdRCs2gnMc4nDIGzA9DJzMvMdY8d22NK6tpAwxGK3xwIDNOSixcPfzO127
         xJuzAZAT289aXZwjFqNNKpkgSrhMFs58k/RYw/FzHRa9PvqrY1E8Sy8ZDIZyHyFatwjY
         H2HfoJ5VSv28PopiMb/+SRfxGugWW/vcCF4E7DLHLYbmk1UPMQ46LooWA9HczPKOnxHR
         EgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649324; x=1788254124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQG7I15zl1cZ8xoz0nJUhoyELZuli5z85AXKE7Cy0D4=;
        b=NjYjg8YX56bN0GOCQF8pf3csrG2f9AMoUIYNzMvD828rQWE7fMX126EsodKggfByeQ
         erQmR7II5xzfvIOaCVf4YqTts2q05iCXSmjE8gg5ff3E7v1vbaympSsGE2bEh8JfX1Ku
         Z/ty1RR549JsFSp2JFuw3J09jRpoAsiu+ah7TyjuKOBLV02G4h3D5kvyoqIxGaFfHoo8
         BP8ZK6RvLB3WD7fCs6X9HX0BHxKc+YI/AOmqdUSt6T12SieelAsPz2+TeiQwVNU3+96Y
         kqJff8GT4wqgOLxjhRbuoev+jWoVymMkTErEDsqSaO5iFVpsZf0X/2KgqGnlHaBt+r7X
         C8CA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8NKG3QGLJZVHcSxMJ5D/9yDC8SMXiktCoKgsjUNXyUUnmVZBhp0VnUjjm8IgKw3sw/sQbO2K061nG@vger.kernel.org
X-Gm-Message-State: AFuF++nm7HMQ3NfuXZxnGNS8FM9LrcEFnTEfU0d7WfOaqaN2+MqotYgN
	xvBBg+1fEZ+wXdvop6c92pKCD0SENUjn5/ulEpBkpozZi9KZAV486wn1Va7C4b4iQXQ=
X-Gm-Gg: AR+sD118WrA4f092OY7K66cKR2NMbFRXlQcj+ugqTU9dRwcKxumLFgDoM/WPugZeMnk
	J40R8Hu1xUVS69ZkeEOKdeGpPpGUqUOq+CvTbBMzDdCRROkNbhq9/uEBRR8YUpYaky/R+OyzSnl
	2NMctYpVnWuKD/YcfKKqj1UI6JgEoYaVQq60AtECY8kzNaAAnJGa/P5GcqmibfdREaa4v0QZ+jn
	UJ5K/en0EIhw3t+DSevkAtbuEYU8u1/Tajjak7YxlaUuTSFV9tzGih1d07QQ7s91+RUSkLHEjbV
	bR/51yzTLWsTEwuDm9CGJfwi6ZNQ2+7XhcWm8T9Zp4lrlQjxvrnFSs9G3+mhi4ix7E1bW5YJmUV
	toMHD6QHl1iphG31GDYIN3oRNq/2y8I9YOI9qZfeIYZ582lEEDwzagHIgf8RhUW8wZsFMR4gARV
	KKSHnFUU3uei9lx41E1e11ZOnu4fB/PibJpsN44yw3cG822BWu7lNVWD/CKOVOdg+qgGS9H/5BX
	QrXe5UVRYNWMztIlrQGH4Sicnhu5lZxdZyysT2LzNo70slwX66VbdGXThrKGWvTfg9TmrxLsN4W
	ZjA2n4j56eTJheJ2AE1Bw4aCkjxhd8RbjjbtRna/IMYWEQ==
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499b845c184mr414028865e9.15.1787649324060;
        Tue, 25 Aug 2026 02:15:24 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d65c326esm20415775e9.10.2026.08.25.02.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:15:22 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:15:19 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Davis <afd@ti.com>
Cc: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: lp8864: Register a backlight device
Message-ID: <ao1dJ1Ce6qcp9USk@aspen.lan>
References: <20260817170817.1933046-1-alexander.sverdlin@siemens.com>
 <20260817170817.1933046-3-alexander.sverdlin@siemens.com>
 <aowP3K7sgXKnsonS@aspen.lan>
 <fcdc4b46-dab7-40fe-9b1e-c5c2e2ef8dd7@ti.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcdc4b46-dab7-40fe-9b1e-c5c2e2ef8dd7@ti.com>

On Mon, Aug 24, 2026 at 10:39:19AM -0500, Andrew Davis wrote:
> On 8/24/26 4:33 AM, Daniel Thompson wrote:
> > On Mon, Aug 17, 2026 at 07:08:15PM +0200, A. Sverdlin wrote:
> > > From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > >
> > > The LP8864/LP8866 is a display-cluster LED backlight driver. Expose a
> > > standard backlight class interface in addition to the LED class device,
> > > so it can be used by display/panel stacks that expect a backlight.
> > >
> > > Use the new devm_led_backlight_register() helper, which spawns a
> > > led-backlight device driven by our LED and tied to the I2C device
> > > lifetime. This keeps the driver a plain LED driver, requires no
> > > device-tree changes and remains backwards compatible with existing DTs.
> > > It is a no-op when the led-backlight support is not enabled.
> >
> > ... but when led-backlight support is enabled it will prohibit the use
> > of the LED sysfs interface.
> >
>
> The commit message states "in addition to" so both are registered still.
> The issue would be in the [1/2] patch if it disables the LED sysfs interface
> as this might be unexpected behavior to not keep both interfaces active.

Yes, led_bl disables the sysfs interface of any LED supplier(s). Note
that this is not changed by anything in the patch series ([1/2]
rearranges the code slghtlt but this has always been the case).


> > Having zero DT changes is a nice property but it seems rather fragile to
> > change the ABI the userspace must use to manipulate the LED based on
> > CONFIG_LED_BL.
> >
>
> If this was done in DT then it would also change the API userspace must
> use in a non-flexible way (DT is also considered a fixed ABI for a board).

Agreed, although it does allow an existing board not to change userspace
ABI based on a Kconfig option.


> > Is there no way to explictly configure which ABI should be used?
> >
>
> I wonder if there is a good way to have the actual use of one API cause
> the other to be disabled at runtime? So the first one used disables the
> other, but that does sound like a race.
>
> Maybe a mod config to disable the LED-BL path and keep the simple LED
> sysfs interface would be enough. Or maybe a sysfw entry so it could
> be set per-device if needed.

Mod config isn't "nice" although it might be a good enough solution for
what is probably a fairly niche issue if nothing better comes up.

I'd also note that a mod config would also allow the driver to error out
when CONFIG_LED_BL is not set (with a hint on the logs to either enable
LED_BL or set the config option) rather then the current "secret" ABI
change.


Daniel.
