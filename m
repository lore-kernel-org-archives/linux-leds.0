Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703044FDE65
	for <linux-leds@vger.kernel.org>; Wed, 16 Sep 2026 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568581; cv=none; b=EAGd8tBuIQKeaSjQIjh6cIbz+WMgsDKIXUPPjHyDkyadrgou44gAcdUvFads63yTua6ZLFRKWowyBE6Q+BRNP2D0lV1p6fn/ZCedSkS8+KRLzOlP6cbY6C5kaPFQLFdI/qyNgU1KrfrBwgHBIbXqrzYJIxEL5lBbaozpNIu+bWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568581; c=relaxed/simple;
	bh=43UrhAuDyRCxIW7zNvxEWB9htMmCXLzuxgZNm08DRto=;
	h=From:To:Cc:Subject:Date:Message-Id; b=FDeiDuRkdLrlvQqeMftZ8QClee4DAiDiXEt+7XZ3ge+5e5swKaXUbOE1kXNIQYVyPf/vnni4aoD8XFGtuLDuYrz+NDoTpf7YcW+TNPTPfVw/9Z3Rygd/uq/UTwskXxeEZ7l3vsBgNaHf9YztarYdUUFsMBvUVGeR3rX4THOoqjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1Z2m11H; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1Z2m11H"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86b90133ae8so771980b3a.1
        for <linux-leds@vger.kernel.org>; Wed, 16 Sep 2026 07:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789568578; x=1790173378; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWvWZC1A4EEg5WDZjdEechEjI5LuFB/6BDLI2Ygdh/I=;
        b=q1Z2m11HO9QkjOyRQtTtu5Cww1Sdy5WzCcfztdw20BU+iuVYXYwBSgEtZ1cVdXjRgY
         WCtE9YvVI0sfqGsoa2nNRbvBeksGjbbTi2NnZEIXbhpMQ1j8A/S3zziQ/EdJv/h6bp9E
         c70PrvJ6kxqZYuKCejNQaD6UxQ04ifiCJEJKlbMKTNevkwKNJr82rn5BwC/xQLqElvOc
         8DsEkDfL3ZvChth+7MjRUpf7oMtoyvusIpTdCN+MnljNaipzQFiB2qijJX51Inx6rJMn
         lPisIT9/I1Dr6DCfm9sBkvh6qPH/lIjBz8NUR2+4ULwNvjMobiZHiwcm8mY13HGWxXYD
         +k9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568578; x=1790173378;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWvWZC1A4EEg5WDZjdEechEjI5LuFB/6BDLI2Ygdh/I=;
        b=nK1Up1vv1MvYkHg4ifOuWAt3Nskk4Z70VV9T1aV9lnO7t1oCtR6VtPOL6sUgxgw2Tq
         +zpHEoJ/W+9xRNHB+27jMd5eSpWEZYYyU6q4WndfQDs7E76dQmy4KIUFEeurDdAJQ6l7
         0eDQmJSpy5em9It+bY/0wfJAOLnrw//9LmqcipvYnZ2gzhtjFSUHHL5AhOS1eirc+z/3
         jKpQfejhxfy1lpG8/iZcGKU4JfFkCWPsfXhWKgPXwR+5FJGdBh2qWmiqAuui7qQDxKzh
         O1l7dqcbyUsx0pO5GW8shDHNXqBd2/8kBjLWpwaH4eEYQPncBWZ1MTv4W9bj0d+GH/h3
         a2Cg==
X-Gm-Message-State: AFuF++lBeRX0zVIxbxNAnHJ/bulebDeoRXrp6alwnItN7f3NmhGbHijq
	Kxp4fGqTkhjr316nIeuylXC4RBrH8Xun/IJkYb1tY6B3UPHlbw7lRbeJadbsX2KgsF8=
X-Gm-Gg: AYBFou3Mf0YUXSdjFKSNjmV6qQxItJvIsYXs9g7WdmkrdRJ4gIyi2JmeNYNjqGediR8
	c/gXZlUXZOHut2+3TvCwF1eigyJVI446/DhJPYlmmC6HUamBSj0pcVWDpUoI4mpRt0hJRTMC959
	TZaGIVizAoxKTX4RZyVXhkG3bcVdilfkY1ckSV39Z2zIbSPoM2e8+V1kuGyjx9udPb5ZRTlHygs
	rCL3wCKMO025iI1s5mVpi8cpiyiXV+2qP+Fn1tEG1F15KOWVlSlJSteetMHJi6tVHqPnklnQgCu
	8csWkZ4TaR2UtKyJj0DuioBmVvz5yoECNs6r1a2UGh4XhPwP/xi96SLN47Bz9KhAOCBYimqfVxA
	2u4EnhYJQ0g/3Htrq1bncuO1xja06DefrSfmNdGWmZKlKxGQ94iBnuFJk1mS07KDSkrnMXy67zZ
	leCHRylHavzecSKueBbwwboR7kRF4G1brLHO5Da1wTwS18OcmrP3QGLxZizzgU+sUsMOsw9w==
X-Received: by 2002:a05:6a00:408a:b0:84e:2382:f4f0 with SMTP id d2e1a72fcca58-872363f656dmr6488422b3a.4.1789568578140;
        Wed, 16 Sep 2026 07:22:58 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d179aesm1390884b3a.50.2026.09.16.07.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:22:57 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Martin K. Petersen <mkp@kernel.org>, linux-scsi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH RFC v6 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
Date: Wed, 16 Sep 2026 14:22:49 -0000
Message-Id: <202609162200.RFCv6-0.lhw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Hello,

v6, as its own thread, addressing the fifth sashiko round (one naming
Low taken as a fix, the other two Low are the same false positives).

Changes since v5:

- LED names use the empty color section from the naming scheme now:
  asus-arion-0-0-0-0::led-0 through led-3, instead of the single
  separator v5 used. The color section is empty because these are
  multicolor LEDs whose palette is enumerated via multi_intensity,
  and the four identical zones take the function name with a "-N"
  ordinal, matching the examples in Documentation/leds/leds-class.rst
  ("phy3::wlan", ":kbd_backlight"). The sdev's H:C:T:L is still
  flattened to dashes to keep the name unambiguous.

The two remaining Low items are the same false positives as in all
previous rounds:

- kzalloc_obj() exists in include/linux/slab.h since v7.0 (Kees
  Cook's overflow-refactor series); this driver builds against 7.2.

- blk_rq_map_kern() takes four arguments on current kernels
  (rq, buf, len, gfp); drivers/scsi/scsi_lib.c calls it exactly this
  way from scsi_execute_cmd(). The five-argument form with the
  request_queue first parameter is from older trees.

v6 was re-verified on hardware: the four LEDs appear under the new
names, per-LED colours, sequential and concurrent updates, and
unplug under load are clean.

Everything else is unchanged: the hardware description, the
scsi_device_handler that does not claim the sdev, the multicolor LED
interface, the protocol handling and the known caveats (manual attach
until a notifier lands; SAVE on every update writes the enclosure
flash, wear uncharacterized; NULL-parent LED registration to avoid
the sdev reference cycle).

The open question from v3 through v5 stands: the driver is
deliberately not wired into Kconfig/Makefile/MAINTAINERS yet, because
the agreed direction with the SCSI side is a split into a SCSI
transport helper and a shared ASUS Aura LED interface, and the wiring
would follow that shape. Is deferring the wiring to that split
acceptable for an RFC, or would you rather have the driver buildable
in-tree from this series already?

One more question on the naming: "led" is not a LED_FUNCTION_*
value. The four zones are identical decorative RGB segments with no
distinct function each, so I did not find a fitting predefined
function. The closest in-tree pattern is LED_FUNCTION_PLAYER1..5,
separate defines for identical things that only differ in number.
Would you prefer a new LED_FUNCTION_* entry for this, or is a plain
ordinal function fine for an RFC?

Comments on the interface shape and on folding this into the shared
Aura work with Denis remain very welcome.

Signed-off-by: Liang Haowen <nbg2974@gmail.com>
