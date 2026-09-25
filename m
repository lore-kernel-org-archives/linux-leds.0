Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D3A49EC5A
	for <linux-leds@vger.kernel.org>; Fri, 25 Sep 2026 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343624; cv=none; b=nzlm3TB69kvssTSr8sOmIOccY3yex4+yvcRMMIqkkgsj7XE4mAvxcmzYfEjjDyv1WHIkgLznD89R6GOAqIUe6y0iENSDJ5FZJ2bvBpQhWVEFQLWOXZNbdGMujNP+YTQSWCswL3MMB5H5GnmI5aQIACm7JfXWFRIsPbKo+1CdDoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343624; c=relaxed/simple;
	bh=ykf8iMJpAcatbima4Jd11GNPsy9PpqpBQ9DAP19u9qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MWPD0ZC9c72Rd/BuCm5A+D7cmni/bOGuL2d8aiRv+LSBgcGaP8FQwcpzJDWzCi5e4luq7HmZH+W82Y+Ar/zwAa4RbKRdoQtuY/h8U6nynsMq7BT5fThobqO6gqVZ8eV8FUoUraeu0ZV6gbx2x5v0PE+TgmnfwtMjvxbfCbBRtVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=An/DBENC; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="An/DBENC"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso262211a12.1
        for <linux-leds@vger.kernel.org>; Fri, 25 Sep 2026 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790343622; x=1790948422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a47bZYCTvp0bK7riN+3+5iqiQ4xgjbaSVoQw1BXJcB8=;
        b=An/DBENC6rZd6oUAFEAByxHXr5Phl0mZZrTw6fS7OGXP0yBH8ynIKnwkPdK9hRr140
         lbJkRR1QEIVhKI9BUNLi6wX1Ix969vvQz5W8d/N9iirsvxKkt26vyvClAvRyf+W1VYNV
         RJzxQW+O2pNjGMkbfjpzz7nOwfuuHYSKcx2qfoXOEMQhlbsrZJ/oAXEO6mit++ZMNcTg
         d+hsrwldBfUPYeFdkYgeEyKL5KBkJnPuNtZJkpZDUwllS8BcTe+U11fk0hS0GtU63mMA
         in0vJ4c4vCnAMjXvhVnoAqPpUAzCNSmk+QmBrxoo0cCYBnOVFItwECfn2zSdqlcE4mAA
         V4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790343622; x=1790948422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a47bZYCTvp0bK7riN+3+5iqiQ4xgjbaSVoQw1BXJcB8=;
        b=qrFjrrQfx0DfAzyepuEcASyJpxcOJBqe1ZKuXjqp706hcXtDWUeMf4P89HCA/Igofp
         M7P2doBCyvyxAgNcaAcfUOUJsU7jcHcAno8iYPb6TFesf8SYsA6JInZCaKKiGKgSrBj8
         foDacIGyILnu/uaSDTBk/dKKhAvbEI8Ac5U9GBS+yMzZlmvjgkdq76g3x3u+7CMowcT2
         SOQKxnfYlhgg6z+rgLxTLTPDWTFkE+imVzmEfsDax2rI6MqdrY/CoxtWVM4MA8/uJDAS
         89Nm4aGeGNpxb5SEKhMy1VlPjU5fM0BpFh+oc2Ejq75uRBP3YB1gB/ABM9oaoSgvLgSF
         2a+Q==
X-Gm-Message-State: AFuF++lvyUkdQPInU1i2MMk2Ffebt6feNSBRdlv8Mi3Lz/95K4T5ObXh
	sVqzy+WnPAT0MCSWDGWNYnP9YbmPv+EyW02QD61ejcLA/nuUpqb4YmIVygff/7NWlhw=
X-Gm-Gg: AYBFou0jOhEK1s43vgxhSXNFclux15hP/70iI6JeVrgvofEjRu/rm3mPSj7o1cAqPJ9
	ciJTM6R8fqThVNR1p8rYBPjq4umF/sBbrwAuUCswoLQizQb7oUIfE13hFSFx9BRi4+J0F46wzRs
	yz6nPH6aIy/rUmnsSUZKUhSh595SW549+JnvNF4KVVpJzRfmILIkMkYTPoH/sXrK5glHn6mSI4e
	zXUIoRFfCsTKt6Y1gXXBsQyABlKveD5sSyhauT6UBhBKd6ndLZ2caCnvNoqZGS4Bm51PbrkXdok
	wZtqI3N61+4QAulDtNE7cPIyncnNTrv4k2CE7ggpHFzYqUdcNAEovJMyUDcTTWwIJnnZAXqTke9
	/S/NHmXf5rAA9lbTZFh2IEss3MLL9SuIpDowDgqFLqiTgDneNRVXWaGTcCVNUZ0MlQF7r2++72V
	02172yzSJlpRzrUKuW+mQmsZkxiY1yzk1HYNbOkL+pgims4c+iMajS3GVPNbZTdjhoI5qPKMq+2
	gEQ3g==
X-Received: by 2002:a05:6a21:2c01:b0:3dd:85a8:4c64 with SMTP id adf61e73a8af0-3de0e894361mr4873068637.43.1790343617712;
        Fri, 25 Sep 2026 06:40:17 -0700 (PDT)
Received: from ROGZephyrusG16Air ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc787943cc9sm1269673a12.21.2026.09.25.06.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:40:17 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"Martin K . Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Marco Scardovi <scardracs@disroot.org>
Subject: [RFC v9 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe enclosures
Date: Fri, 25 Sep 2026 21:40:09 +0800
Message-ID: <20260925134010.2815025-1-nbg2974@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

v9, as its own thread, addressing Ilpo's line review of v8 and the
one real sashiko item. This time the full pass over the code was
done.

Changes since v8:

- The DMA staging buffer is cacheline-aligned now, so an
  invalidation on non-coherent architectures cannot clobber the
  rest of struct asus_aura (the sashiko High).

- One pass over the code for includes, per Ilpo's comment: the
  explicit set is array_size.h, blk-mq.h, blk_types.h, blkdev.h,
  build_bug.h, byteorder/generic.h, cache.h, compiler.h,
  compiler_attributes.h, container_of.h, dev_printk.h, err.h,
  jiffies.h, the led headers, module.h, slab.h, sprintf.h,
  spinlock.h, string.h, workqueue.h and the scsi ones; unused ones
  (bits.h, kernel.h) dropped.

- ENE_OPCODE and ENE_TIMEOUT are defines again, the timeout value
  stays 5 s (Ilpo).

- The container_of() declarations are single lines (Lee's v6
  comment, Ilpo's reminder), and every loop over the LED array
  uses ARRAY_SIZE() (Ilpo).

- The MODE/APPLY writes pass named locals with sizeof() instead of
  compound literals (Ilpo).

- The driver now applies without saving. The controller flash only
  changes on an explicit save command, which this driver never
  sends: the LED class interface is runtime state and does not
  promise persistence across power cycles, and a save on every
  update would wear the flash. This drops the flash-wear caveat
  from the previous versions.

Everything else is unchanged from v8: the multicolor LED
interface, the SCSI device handler attachment, the protocol
handling and the remaining caveats. On the interface direction:
the LED side will move onto Marco's Dynamic Lighting class
(OpenGamingCollective/linux-unstable#17) once that settles; he has
removed his draft SCSI driver from the series and says the SCSI
part will be added by its maintainer, so the two efforts are
aligned on the same split.

v9 was verified on hardware again, including a visual check of the
per-LED colours: the four LEDs, sequential updates, unplug under
load (zero splats, zero leaked nodes, clean rmmod).

Liang Haowen (1):
  leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe
    enclosures

-- 
2.55.0


Liang Haowen (1):
  leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe
    enclosures

-- 
2.55.0

