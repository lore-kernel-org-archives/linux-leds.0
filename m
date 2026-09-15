Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933083B42E1
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476544; cv=none; b=Ghnffxo+X1ZDfRR8puE0aQ4WigQ3xHAKeOX664H2P/EQMREGhmZ2RjwzEFYsQTDQooXzLZP+b2NaP5ialsEammGjQEujNVTZMYlAjT2ysmhUw9A2/ZNVgelU4Pw2msYRUdA5BXL8dnuHpxTK+xTGDfFIDCgyX1xzlMAVzSBZJdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476544; c=relaxed/simple;
	bh=YFHzDuiSQXSIMebzDRCSKEz0SUhCBqu8HZ+JLzlNMtI=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ki0PLqrY95G5rcXvlfwjRqdVN5dfG11eYG3QBr1U+fjOSI3HsKoOneH6E921FUpPb1I2E6n9H/rx7y/94PH2QXhs46dH8McnrdSyEsulaPteMKKgc9FLXoNcF+z7IFX+6vp86DptwOTn48x5WhhTVWDOiNVGZhHFSg2bT/R4/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFb7u2Tr; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFb7u2Tr"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so23152105ad.0
        for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 05:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476542; x=1790081342; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4NEyPUzdcskfuL6SgD4LKloEIz4xPCUOIfMYZX8ltY=;
        b=DFb7u2TrVWtDC6Qq5VonQ5y2Eno7vf7CBQVoAV63ywLB9WT0T+27nkyA6yjSyunuX9
         ZUMSh76lb9z3WI87LNmWa5FIO1PoORJpclzrDvxLY+EpECdFtRyw2RF0/zdsI2Bgr45+
         JdEJV4nb78TfntkjcgwYUZOrRI1qzSoW+D8J9yDZtY82hh/ABfe0NDCiBvdoerTYcd2F
         urRnaPBZnfrq74XuRUX97vWmpv6dYpqTvwgoE5/GC3r309s3WZwSqS/JyNIh/jxIP5SU
         3DOs13v36CcG5FSs9EnzSxfdBkqRNNoHpLRt6fWeG0YNwClKyvfAon1GjPllksjonoEe
         qYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476542; x=1790081342;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4NEyPUzdcskfuL6SgD4LKloEIz4xPCUOIfMYZX8ltY=;
        b=Wri73j63X5MZn5az6LCOqmW6iK7nfB2j/tplGVDB4byE+o6tqkfzEJRGVehSqnLr/o
         0xqtioK6gvpiBs6izsKCOTECExJh+S1Wj9A5JmRKVmsAkW6B3SPQmtFas/FfT9UPsAhA
         kYvePEB9xAN+K5m+PM4gQv3xQN5dG0RNIQ9gMRxte4FI7SkgojFQ7LSsqPWXLAGuBNI+
         OUM9OIO72Yk9rmNgkjehpBa2sARWuqWQ0FswqkRkpF72iXxFzRKNbGOm6x70GD8X/aMX
         AFI/UL+eov2QTY+8ZVvwzPtNq3CS8yX3K1+Qh/gcJs+XD5z8367m0KpBESk4e2WMOHvs
         k3RA==
X-Gm-Message-State: AFuF++mC0FTcvOPF2NiIqJAf1I4y1oFJ6kK/jWPk4yYK1uVGSK7cH48f
	wFlayM/TIkbasx9DHdNcULgQjY94kVCPuDPXcFP3zeyTkhbbQk/OHrMl75/LpUPD0qw=
X-Gm-Gg: AYBFou26CrH2WGt1xvKkUaNaYF3HRB6NVPDWZcKOCh28wgdxhLfCF/wE4EPY53RLnYi
	FCTfDLfJceFXxQu2lOY9xJWJ6HzUhvhaNu3YJgG6PRbhGuuBMpHMrmzi9v4dTG7RI1LYizArVyS
	MtX1F7B5DpwqpzxVx7dJ+oReSYIIsIHAAptjDk7ROpxakkQGxEca6Y6wEJjO7uRPR45bnxklyHn
	n7d1QhNyTOzLpk74CjBoUB71/z0oWgOJjNNlEHH/W9+BpnKC/pAgrS7SRh4LUryfoPEuyhAZvUd
	4gLkoQ9Kll1BU3uistbuJP0ZAlWRPU9MqnLLBgm1RMZZQE7muc+055Se+0tuqTQOEkkmBpeLlXu
	Y2wyk5v3oVtEGe7+poWw2YJeFI9jL938ElSHrsz70gtVLEuu6sLUNPQmBcQCPiu9ZS7zrLKsGNv
	iPCkNtrKngPz5Ggc/bJR0h5EK045Y87o3Go/0UkSY2mi8CaHNBb0HaS7B0UiWw1Fiy3in59w==
X-Received: by 2002:a17:903:11cf:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2dd6c5ee698mr129931065ad.8.1789476541491;
        Tue, 15 Sep 2026 05:49:01 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:91e2:d400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd48ae3cacsm52866095ad.26.2026.09.15.05.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:49:00 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Martin K. Petersen <mkp@kernel.org>, linux-scsi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH RFC v4 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
Date: Tue, 15 Sep 2026 12:48:57 -0000
Message-Id: <202609152112.RFCv4-0.lhw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Hello,

v4, sent as its own thread this time, addressing the third sashiko
review round (the Medium naming item is a real bug, the two Low ones
are false positives again).

Changes since v3:

- LED class device names follow the devicename:color:function scheme
  again. v3 embedded the sdev's H:C:T:L verbatim
  (asus-arion-0:0:0:0:led0); the extra colons break the single
  separator userspace parses LED names with. The colons are now
  flattened to dashes (asus-arion-0-0-0-0:led0), keeping the
  per-attachment uniqueness while leaving exactly one separator.

The two low-severity items are the same false positives as before:

- kzalloc_obj() exists in include/linux/slab.h since v7.0 (Kees
  Cook's overflow-refactor series); this driver builds against 7.2.

- blk_rq_map_kern() takes four arguments on current kernels
  (rq, buf, len, gfp); drivers/scsi/scsi_lib.c calls it exactly this
  way from scsi_execute_cmd().

v4 was re-verified on hardware: per-LED colours, 100 sequential
updates, concurrent updates from four writers, and unplug under load
(zero splats, zero leaked LED nodes, clean rmmod).

Everything else is unchanged: the hardware description, the
scsi_device_handler that does not claim the sdev, the multicolor LED
interface, the protocol handling and the known caveats (manual attach
until a notifier lands; SAVE on every update writes the enclosure
flash, wear uncharacterized; NULL-parent LED registration to avoid
the sdev reference cycle).

The open question from v3 stands: the driver is deliberately not
wired into Kconfig/Makefile/MAINTAINERS yet, because the agreed
direction with the SCSI side is a split into a SCSI transport helper
and a shared ASUS Aura LED interface, and the wiring would follow
that shape. Is deferring the wiring to that split acceptable for an
RFC, or would you rather have the driver buildable in-tree from this
series already?

Comments on the interface shape and on folding this into the shared
Aura work with Denis remain very welcome.

Signed-off-by: Liang Haowen <nbg2974@gmail.com>
