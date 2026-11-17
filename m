Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938274;
	b=NEOOOXZy3qC+dHwYqGrPuR4igURCA81pVLxAup2M544t2Rr3aMK62MWhGfN9LHOsTlRk
	 jhbO5r3xUkO9pcuLb49Y1Rkv1Tl0jWGRUlTgNcNywI9ZyoQe0ms8xFTSn8X3sKy5VyG+b
	 lNNzAv37hdHd+b5WKRpLmhoV3AOrOAltGibMK0OGghyvPY2V4LPaL/qwsL4jR8QsyJrn6
	 JISP0uT49fFa9dgcBd47/En+VjkhKy3DLmCm0QAEO6OuJClUAs9YGJVst/KffYbZUyntb
	 WeIYkOvc36jAbgB28jYrcKQlvHXR0Gg4Z2BfJwWFHIAKmrgP+61xrloSlV6JSQbVExg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6OmLsnYmVAhHtUT/tw7I0eakdU+CbXJFeYEGxxFLd9U=;
	b=vh/HQE41YuNH6d+fCHuwYwaA9zeWjMf2xvcGm28Jgtn7zS05iuxeWWY/wz5qrgu/BvIN
	 pGu9whpZT9XPFHmaGgx91OHNaENkrxRnk3KmQ4AyUaKfMk08AOtJob0dEQpqoDg8AzZL/
	 ySd7ycX8rQwNh+CHX+SdUAnRV7KjaGTKA/b9xEGf2aZs080+BAih5JKqikxD9LM1C1d5B
	 c9SLeEtqIo4N9xFfU/0+ffXlta1cVxZwx36UbVAQ1378BJDqAvb5p1hBqGjfzjgCGRi4v
	 wV+58itjqYhoyyFzyTcszkI7Kf80QDdmC6/qIuHNjIP+F8XITBBGv3C6nRi4MJbz66g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xTd/rpxX";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835FE606A33B
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 17:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 835FE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xTd/rpxX
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so1622725e9.3
        for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 09:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938273; x=1795543073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OmLsnYmVAhHtUT/tw7I0eakdU+CbXJFeYEGxxFLd9U=;
        b=xTd/rpxXnSuEiCi3nlKYbImD0NRNAlU3R7IP/yeXQHD/2W46U3TD/8Tvup90FfMIGq
         1q4KrU9r7N2bD+qJfKWKO7/wjC5MT4jAr8Z1nwTcrq9kR1+pB3dhtBCrh1OFm2id4mrc
         bbyra1qF8hRyczHOAvnn0K9cIfplyh+1jyg1mYEeZm+wwwjGNMy0W+scBh+AHe7FOPW3
         +5XFRXB7CXsUj54BSkHoe/C4oXx/rhXLuNk1ZKGuWHJxQqmbpuh8ipIeqhlEeKncgTwl
         hnU23Hf7gW84f6ae9Uw1/yfAxTXzLVP7aPL5W692KoL74+h1E1esTWBjV/U9psrpMjDQ
         fFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938273; x=1795543073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OmLsnYmVAhHtUT/tw7I0eakdU+CbXJFeYEGxxFLd9U=;
        b=1o+POUyga7Hap7M2g260y701uf+jJSK9A2X2NdayYN7epG9B5ZYa2JpscXr5KzAn9T
         mkSipgK8psr94oRL7c7hGVGSFToeFEEo0HZfGtytgmIMCdNVnwhUdHijWd0sVBeSzo68
         BBgPjH/Rbqgw+VR4EW+JX22PNPozIVBVQiHqGjKeIdEY/uUwZiqJbZerB9l1S3gDc3Lu
         RLi+0wXKOgH8TXrLTL3ymZr7lASgp/Sngkie1wig0wyK/dZr7sWIFz0sSapJMO5JNtB3
         JHA/Tx8rxqHabFmny8crMPu4w6RNNpIdh1jxYtOcxgH2hl8MQ4B6P9Kj4HrFzkYNbIX3
         uwaw==
X-Forwarded-Encrypted: i=1; AL+hErG6nDDLrH7KeGcgJJ7vzs0//iURrrwqVy/7Cdg18xLz2WhYxPNKWopUUCPLwZutHQhE0v5h+uClddFN@vger.kernel.org
X-Gm-Message-State: APuU4Z9vq1Orrs2QvbXfruevNiuyxNFCcbMH501hLxR5NbO+0QlPjvyp
	D/qUQDxKF/buAy9HbvPdYAT5BLca424Qd61h/Xz1/DQypf7n4Nj5OXSz
X-Gm-Gg: AYBFou3KqEJe1jYrSTxDcYl2auA8/yBtok2UR+32/nBHTG4rPf8ySwY+eHbn8n/h86n
	n5SMfg1mkz6nrV4tL4ZTPbJ2yxa/IWO22mlZQsHSBFF6kQmGbgLxutGYgjzO+7onvRKrZE/MMsR
	+Z5ayB2Nesi+4ODdPIY0ph86pfu5uNCW6c4D/b/vaVmAtD6IuHwZyz1AI9FEr7lFuThTN0v7Iqp
	ZwNU3bOP/EjC1pkHX2/Q2fE6HN4obY5vbnr2kxKRQyPC9Os/ekWOLXSHNgBw5KrM98yIwwtGvpb
	Zf4iHbyNCC8T5XfVzOtAp7ge8gWg/fVU7boXL0jFbhi0oY7RWBaAUPDUHcnTsbpmK9JmeYJZEqI
	oQ7nfeLiNxFRHX/7xok1I2VcFzamgkAunBCDdpJczUpfqpodQV5PhjtPt1djxz2TJu9OZo+KOWZ
	QrmIc5tK14Y/YZP6GTTvex4KD14T0/6HqOVSYsUgvVKWQRCn+zyId1Zy13rf0iIUHJcPds3F5JJ
	0vZMwr1QRQnNx3fnfRYzXaXepAe1hI6xpICB07ZswfIUYE8LJRouXblrUh5//GDQ1kcKJ7iUfiW
	PsCVsLD5nXVhROuhIwsIv3roA2+yiVJ/Ih0TTL/U/f95KA==
X-Received: by 2002:a05:600c:1f90:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4bb55a45050mr312420955e9.5.1794938272804;
        Tue, 17 Nov 2026 09:57:52 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:11a1:dc8c:1ed6:51c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d28ec3asm1590935e9.0.2026.11.17.09.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:57:52 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org
Cc: griffin@kroah.com,
	hansg@kernel.org,
	andy@kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: flash: Add driver for the TI LM3554
Date: Tue, 17 Nov 2026 17:57:45 +0000
Message-ID: <20261117175745.11897-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116180809.26946-1-volodymyrchapman@gmail.com>
References: <20261116180809.26946-1-volodymyrchapman@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lee, Pavel,

Andy Shevchenko pointed out, in review of a related camera series, that
drivers/leds/leds-lm355x.c already lists the LM3554. I should have
mentioned it in the commit message.

It can't be used on the Lenovo ThinkPad 10 as it is: it only probes with
platform data (no ACPI or DT matching, and nothing in the tree provides
the platform data), it does not drive the HWEN enable line, which has to
be raised here before the chip responds, and it registers three plain
LED class devices rather than a flash LED class device, so there is no
flash timeout or fault reporting.

This patch follows commit f1aa35ab5943 ("media: atomisp: Drop the
atomisp custom lm3554 flash driver"), which removed the atomisp-specific
LM3554 driver for the same hardware and said that it should be
re-implemented with the led-class-flash API if needed.

Would you prefer a separate flash class driver for the LM3554 as in this
patch, or extending leds-lm355x (fwnode/ACPI matching, the enable GPIO
and the flash class)? I'll do whichever you prefer in v2, together with
the fixes for the issues the Sashiko review found.

Thanks,
Volodymyr
