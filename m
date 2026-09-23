Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D44F4AB1DC
	for <linux-leds@vger.kernel.org>; Wed, 23 Sep 2026 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168387; cv=none; b=nucgJ5C8jnp/V/8bOdZRSIdrkUdcT8nRRwl66EH3l4N9E2FMUJ22S5Mi8kl5dqxbA7qSRXzUj9Y6sy1Fxk6Lbdwnw1RUtWdpJTGGpKXgYzlwHkmdH8dd5SJZA63tthNgZyyGb9hFoHqUah9yQLlkrCkSw6gLgqcIxoDXc4sbm3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168387; c=relaxed/simple;
	bh=TD4XUS6zybk9U61zmSU3P1MtmpnLFgJQ/bxrTRjLYS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=og9lCTr7Pj4/Td4uJF+4dUc1HFyqRf3POR1AM+iTrMQobmDBEhiaeGO7PIfayLS72uJmOXdX8emuy3NYCEZuTlHG89+KEYDUyep6QXhwsOAy20bXaV5HKLPNhlumcw+R3XGsT5gLFqFixxQig7QZ6Dk17Icqin5KEyLfVrDElCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExbRk1dA; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExbRk1dA"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so492077b3a.1
        for <linux-leds@vger.kernel.org>; Wed, 23 Sep 2026 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790168385; x=1790773185; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TD4XUS6zybk9U61zmSU3P1MtmpnLFgJQ/bxrTRjLYS4=;
        b=ExbRk1dAAwSwEyE1ABuYIA3J7px1iQ3y8sgN4c3A3x9VvkpPneNRe7j1a02xN06kTd
         3NBFUXuLhbMomg2yaP5kfVEh4NSrYiXZNZN4wz/rp/O32PsRDqtSgVx/ZdN4euRUoh76
         Hc8E9sAlA/J+y+NMSVgkqfz0NXh34QvyFThXtwB72dZKvhAqpf7yB3J9pH0WuqQxRmh0
         7vPAzKIoVx13fdGxbufi7yMs21w4Jq10dv9osF3eYmQnbNORGmVB7fQ+K6J4zBTsQyE3
         cGTWUswr8vpcoXALR7QnjlbxfD2z+ILqus3S9QIh0FU5qDyrdlvUJX7c4CdmrOLtUmzY
         Dghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168385; x=1790773185;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TD4XUS6zybk9U61zmSU3P1MtmpnLFgJQ/bxrTRjLYS4=;
        b=pLU5pXsVohd5KgPWaBrmRnANQbJbS0o7c3IhgO/8uXFM0+HNJm+KkzjNpXRCnYxBLp
         78gTkGS/Zhp5zyMnkH0vQdwfo3P6ykgLQufXTgMPP5ZAqD4h8wMlii3vNhzvrxsi3OYk
         2Ncu48wuwxFN+3oL/JCp4+shFKbNGVrKusj8fXuidpzD/W/0q7809iDrr291SB5bb/xm
         k9ThvYKtEXq0lbMlwpwqQ3oGTLNWBbCRNSfiMetqa4uJpBozYS6UHcrM8jSl4aWEWOY6
         dum04bmJbM/VUa0vjrcX7yxhUYmkgXPazgFL+QSzW5gpwTyVo17SnFKkZP4BjbJj3c8R
         s9fg==
X-Gm-Message-State: AFuF++nz5n0Sl/1eRHKczPrvLSSnGUE1A+5DDt7MkBXKQJR7+HIstytO
	sTSyDMclORK4BTQbJqK3mP+UAgmPBmf45CzfOvgow4xPH3JP8V5iVz7G
X-Gm-Gg: AYBFou1C7xkSIN1V23b2v5alThhF0TTeI0f60Js2she/m5dXAeJN6XaDO4A3OuKhpjK
	4mnN41ow/vwkdRha0BMoMT5jQKtoI0Qqvm23ScOUpmgFrAn11CfXKIDede1ZjLc+kfs/YDDOlwQ
	6KSxJlIMLJjJytLcpSTOBf6S1AAPdWk3M9l9Ynepu6h7Di+RKWyVfQFisg2A40RZ8HdxieyhuxX
	Fkj22DYsNEoUSj+D0y/vBsvSS/wWTAyL8dtuUY86xS6tbTG06w3GnTJizDozQKFpo/jy2ZZb6+a
	/Ik6ECOctTq2/C1M5oKVJFjGqd1V5c3NCbvnWmLOm+iH4lNUj69ytu+PqqpmBioqM6Iz3BQRCWN
	tr1hGjnxM70JooWxR5qfWhvAHXcCn6Y9qQAcCtogYWoNqZRAtvALU3VaY7ihC93MHX6N38dHh72
	UdreuazVIorb/rxN8AQPR/ZtnnkRc1CFlVVp4xAhZX8ImWBKrvNRfVYMgdAPOEDJ/Bj+LFrg==
X-Received: by 2002:a05:6a00:4214:b0:87c:3650:6f29 with SMTP id d2e1a72fcca58-87d1ba9e55bmr1912460b3a.42.1790168384696;
        Wed, 23 Sep 2026 05:59:44 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cfbfd6esm1171555b3a.20.2026.09.23.05.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:59:44 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Denis Benato <denis.benato@linux.dev>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Martin K. Petersen <mkp@kernel.org>,
 linux-scsi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>, Derek J. Clark <derekjohn.clark@gmail.com>,
 Marco Scardovi <scardracs@disroot.org>, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: Re: [RFC v7 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
Date: Wed, 23 Sep 2026 12:59:36 -0000
Message-Id: <202609240122.ReplyDenis.lhw@gmail.com>
In-Reply-To: <52904b48-a5fa-4872-b9bf-a05b1b7bdea2@linux.dev>
References: <52904b48-a5fa-4872-b9bf-a05b1b7bdea2@linux.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Hi Denis,

Thanks for the context.

I have read Marco's Dynamic Lighting class series (PR #17). The
direct frame and palette interfaces map cleanly onto what the Arion
needs: its colour tables are just small RGB frames, and the
enclosure firmware effects map onto the class effect controls. I
will coordinate with him on using it for the LED side, on top of
the verified SCSI handling this series carries.

On the open review items: the next revision will isolate the DMA
buffer into its own cacheline (a real issue on non-coherent
architectures, as the bot notes), and I will take the time to get
the full pass right instead of rushing again.
