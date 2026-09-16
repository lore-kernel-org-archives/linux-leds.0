Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEFE4B2CC8
	for <linux-leds@vger.kernel.org>; Wed, 16 Sep 2026 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560937; cv=none; b=nJ+2MSbRUIEXPZESl02KMB18YxOIrsnJ4VTq4QM6IloP+vCw+rD1CdXk/+jyXxBLKcC+mzzPswt21Ec0dvdKFfY4zeQdqv5Top79ujohHiYunMVSFY3vp6i53K6lFOIhHaWs2YKbG5LEtXxH9GNleHhOG9U0bNe2804tUtHd/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560937; c=relaxed/simple;
	bh=mKSCs4efO4oPsuBT2TQVVQpT0G+dF938WzWWznsLPTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=hi4voBA/QIall9FkaX/j7wWHWUGmaZ0zCJoclbWD5UqJ5GBfkh3yXA/BGZQDLzXUYsl3xV24xGpdRBQeArH5XNqLL7H0GpdYbzkSMOwzjeZyUeISpFSAN7Qe3QLA/kNpP7Xnr/Mh1oEiDWXo8R3lqLlf7TqAf1nsZxxE8WnuGQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBxN7Q85; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBxN7Q85"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2842673a12.0
        for <linux-leds@vger.kernel.org>; Wed, 16 Sep 2026 05:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789560935; x=1790165735; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mKSCs4efO4oPsuBT2TQVVQpT0G+dF938WzWWznsLPTg=;
        b=mBxN7Q856FQQK0Kas+Nkluy4tWlVrpKis1oDtUSwfx28Y8N6polsasRDb10/K/BL14
         skqkiO2MEHvXdz4/JRgRhu/QR1+dHfzns/QrLe/e0VVNJpCEX42F24m6ECJeVFYs67hT
         sg4RnF1UH91AvNWM3NuC0kxlX3cl50ElwC8SXIksV/pcdsfsWActIgn4+KbfDRkUtsHG
         mUIXcIIoE8HrNfnobSirKa25oM8D0OKakbW//5lSjP8/Z2GMyBjw2v7iCuXrhlEr4nMj
         K1iOjjFeJGvaciqwj0HCBhB+7FDhZ8YG9HP3wxzl2I+M0CxxBdcHSjjpXe8BBlMtgMgk
         tW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789560935; x=1790165735;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKSCs4efO4oPsuBT2TQVVQpT0G+dF938WzWWznsLPTg=;
        b=jm2EHXQbaxFi5MIISfNjrWlmR3yw7ZYIoT7Qlh1pXfuFpi6tvwcpBPDXmX+LEsyyKK
         r7oLwfxE53LjNp7v4jUJEiJAe31j1o7YELYG2wt3Uhy9EHzPq4X+oTUVW7Wg6b+m4+kg
         IlfUP/nl0nqgv7c2AFCTTFceDTbeozxv/jVS4Noy7MVK8IbkKy0tESop0cez+znPaZ+y
         lQhQXRpoawBZN0aQcPxrvKpHhTAoxSy/ZsA4x5lbIZXW1ysobOmUO1m1DR4/y023wYvi
         a8IEuKkT1ccoGE3yOvklI8HWPzhAZlUDNe8VsrPiGkNlIvGUztQkOSRAIcO21PnPkAgM
         iLBA==
X-Gm-Message-State: AFuF++kVSaozicUVVKZlST1eqDlj+Uv+yL+vGwriQgmBzx72mycyLxej
	E62hkz7NfEUf+P2EgLPeCw6lYwNqOhDuh9eYawX+zrgXSLHww1+SKUf8
X-Gm-Gg: AYBFou0PkqT5d10rHtDssP9/5fA25v/yDkigshAfllTwLhbKemn14rjZSv5fOQc62zB
	YcgZ+/y32BvjuNk1zRcGCi9sLhX+fmpx9vJeHiqZpdaE94dzDOAG1Jo+pwk8phDHI7w6CitxXlf
	BQoYY0CsvIbE8Cy4jSG1xe8u2wz9Z/RQPcs5Qe9KhClfckgAI9/YwtBKj0bt8kRup0Ww9kYNfM3
	wp2ntZS3GnCWIU7Pt/GtzX8IcMYJSl9MX/d750EeHDNvvZCuooKBxB7gU1JKPRluD08PjXsT7I5
	zX5wvmd9ERD2AgU/wTKcw8d8Iul2Z1hDS0g26YXvhEUZ2bg8hPJ7Og7Ue3wEWAzx6md4hBvOgNK
	9Pq4jOvWqB2d/oxalDe2eQcVgh8YIllNv6/pkVPi0iwCyczfSBhA9OeUjeb60RFYhA+kdx+EPUa
	2O3vnU7JI/CvxMrRhAyrYML5+H/LyTsxFaOGj5KUVMQ4hf/JTVWfq75oeotBM4LHyVjKt1ZQ==
X-Received: by 2002:a05:6a21:6da4:b0:3da:eff0:c162 with SMTP id adf61e73a8af0-3db4fa37105mr11544412637.6.1789560934398;
        Wed, 16 Sep 2026 05:15:34 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab8ae01sm1512489a12.18.2026.09.16.05.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:15:33 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v4 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Date: Wed, 16 Sep 2026 12:15:31 -0000
Message-Id: <202609162015.ReplyLee0916.lhw@gmail.com>
In-Reply-To: <20260916104305.GM11487@google.com>
References: <202609012200.RFC0.lhw@gmail.com>
 <202609012200.RFC1.lhw@gmail.com>
 <20260901145204.2BF551F000E9@smtp.kernel.org>
 <202609032000.RFCv2-0.lhw@gmail.com> <202609032000.RFCv2-1.lhw@gmail.com>
 <20260903122408.3CA6B1F00A3A@smtp.kernel.org>
 <20260903161357.GX2133376@google.com> <202609042000.RFCv3-0.lhw@gmail.com>
 <202609042030.RFCv3-1.lhw@gmail.com>
 <20260904131503.355C41F00A3E@smtp.kernel.org>
 <20260910093232.GO2133376@google.com> <202609152112.RFCv4-0.lhw@gmail.com>
 <202609152112.RFCv4-1.lhw@gmail.com>
 <20260915130050.E8CDB1F000FF@smtp.kernel.org>
 <20260916104305.GM11487@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

On the three sashiko items: the Medium one was a real race.
led_mc_calc_color_components() writes the shared subled_info array
outside the zone lock, and concurrent brightness_set callbacks for
the same LED could cache a mix of each other's colours. v5 moves it
under the spinlock; v5 goes out as its own thread.

The two Low items are false positives, and the same two the bot has
now reported in all four rounds: kzalloc_obj() has been in
include/linux/slab.h since v7.0 (this driver builds against 7.2), and
blk_rq_map_kern() takes four arguments on current kernels, called
exactly this way from scsi_execute_cmd() in drivers/scsi/scsi_lib.c.
The five-argument form it keeps describing is from older trees. The
bot's reference tree looks outdated; can these two be retired from
further rounds?
