Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7374A0F0C
	for <linux-leds@vger.kernel.org>; Thu,  3 Sep 2026 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437332; cv=none; b=N29JKRF9QPWy/bcfaehpBsQIki9//iqI+pO6YlmfUpbn0YnXIHOPjXUvmXHLOuy/pOtR0vJeTHPeB4djtv3ztOCVrAhpg9rWgcEJq4X5Wh0yiv9Z90H+EYA8mmpgZgxeT27vyJ6V9fVzcLz5v8RW2GK29MqPfOZ+rj4B7DA9yyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437332; c=relaxed/simple;
	bh=DS92zY7UggopypjAfNvS0nI3xwM4VczeNIlJ4DH107g=;
	h=Subject:Date:Message-ID:In-Reply-To:References:From:To:Cc:
	 Content-Type:MIME-Version; b=SD1giOmbsdcTTGHNmVFCQsKkIvrO80rAPEabVc8Z8VrRf6vLSmC40XdEu0UA7bSmQNzR2Ydbu5e0cVfXuyVMvHylPOou8148Q8z0pGsjPSZ8qAGa+418zMjVufK4dAjSX8BdAZMZT2jRKP+2mttBwjTg8nCLDkdm3LRcLH1L9IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9Fzd3DH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9Fzd3DH"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84830c774a0so2507444b3a.1
        for <linux-leds@vger.kernel.org>; Thu, 03 Sep 2026 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788437330; x=1789042130; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:cc:to:from
         :references:in-reply-to:message-id:date:subject:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0cSmqLTzwH1GLgzGsnxGCY8DR/cpVAEWeeTTJ8+EvwM=;
        b=I9Fzd3DHr94RnEW96jbjjh0lOCRs2n0uCr8IiwQDB6Z++YbtCJrZESgK9f+VkpxCrG
         MrMSCeiu90unl4FhmHNdSebLSOQNBv+RqdXAg3eHW93m8U59JIx6+WG3xyfNYiD5cfC7
         C05aGUTkuaMvl6OuquhKwSRIwvu94nmhA6+rVgNuTpILGFSnhiu9PRJvVNyKOCsU9NK2
         E3GMpc3+TDCtpiY+rGfin8sJ19UY1VsD9//1SR3caiN73oHK68BdPwRM9tnspdkXnbzW
         UuCHxylht5SvWPTul4v6b+sxXfpdJu5P6IuaaL8dFTVu+9rcsxi9ZIe0ji3HEjcjl2+B
         43JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437330; x=1789042130;
        h=mime-version:content-transfer-encoding:content-type:cc:to:from
         :references:in-reply-to:message-id:date:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cSmqLTzwH1GLgzGsnxGCY8DR/cpVAEWeeTTJ8+EvwM=;
        b=An9sBogUm4WTyzUtEY1sDkcXxP2FP4JM53uWSklPo3zOnufWcrl0K9A/9eKAiOnvwm
         mM0+N5S1w0u8yD/cY1zJYU5VwqBhEQFaUOXG4HtqLpv0diex8iOolzEOEncTRp2a5Tdj
         HFqnfhHzIWUv/BPWGuwHZ9KmSvWu+e6B+5AxZG/Vnce0izaCNTX/jqymZk9DeqYQcoEn
         ezH8Suq3iwo1zIFQV72bviKtz1ZHTy15kqAmcqRmNsjCIW8YOjRQ/XuT1u4bhZuAMGVy
         iwy7MY0GVHBcOr9S8lzotUdz55TVJ8FhirEOVn6hcrn5JidP76G3lyamWoItXFlZbCno
         WmIA==
X-Gm-Message-State: AFuF++nS76r6kG3oziy40JQ1+LhqWDU+R9flZW1nWmt8PO04BUYhUnvk
	KeZLVynpeYPbj5ZJKt7trAWV/2YSGleo5fDlLG4/BDC1ukDPJk6vYooKx3HMUGKQv6Q=
X-Gm-Gg: AYBFou25Cvh/9VIfCZBFOT/1g49Z+RbnjQCQZbCfoiC5uRFJOAbjAJ8GNLd6G6lFFah
	2UqGwbnZnix4nquQUfQMx3wvhRftI6vkQ2tZl4epzILWMWDcynHkcgAfNnR75BpSg+vNwc59Vmc
	Yh9RVzOp651AQY1VuC4Yxk7CF/Rye8j5ONPl0hAYsy960JVc/X+mlA/vlMa7+xGle9nyzhXIavZ
	bCRZwP7PGlUjIpdS/5+qMq2sygPGeF2TLt2pq8cedt6dZXF7vncpT/qikIfGS1rCYn0Mg6oYklp
	LLFjdcJRCnnMbdeKi11bnpEI3ckqX52DqOCTyecIXu8pq3XZdagh+6YVROwYbrNqg/QlTIUnD6E
	YwG2Q5FYCdQTdig6B0qKdUSpGC+XxpNc8nwA82mV0uyUGVmcbj+SqjXTn0J7+utLIWTRv7URVft
	rOdnR1J+faFanfBn3g7IiMCltSlIyaw5FNl5KiP0L3oH6teu50iiD24QQ4D3g/GLo+JQ==
X-Received: by 2002:a05:6a21:3944:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3d9af3efa11mr19982146637.26.1788437329916;
        Thu, 03 Sep 2026 05:08:49 -0700 (PDT)
Received: from [192.168.71.146] ([240e:b8f:91e2:d400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d424edesm869853a12.22.2026.09.03.05.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:08:49 -0700 (PDT)
Subject: [PATCH RFC v2 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
Date: Thu, 03 Sep 2026 20:00:00 +0800
Message-ID: <202609032000.RFCv2-0.lhw@gmail.com>
In-Reply-To: <202609012200.RFC0.lhw@gmail.com>
References:
 <202609012200.RFC0.lhw@gmail.com> <202609012200.RFC1.lhw@gmail.com>
From: Liang Haowen <nbg2974@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Martin K. Petersen <mkp@kernel.org>, linux-scsi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello,

v2 of the LED driver for ASUS Aura RGB on ROG external NVMe
enclosures. It addresses all seven points from the review v1 received
(from the sashiko AI bot; there has been no human review on v1 yet).

Changes since v1:

- Teardown order: .detach() and the attach error path now unregister
  the LED class devices first, then cancel_work_sync(), then free.
  The v1 order (cancel first) left a window where a brightness write
  could requeue the work after cancel_work_sync() returned, so the
  work would run on freed memory.

- Request allocation: ene_write() now builds the request with
  scsi_alloc_request() instead of a raw blk_mq_alloc_request().
  scsi_initialize_rq() zeroes cmnd, initializes the rcu head, sense
  length and retries; skipping that left those fields uninitialized.
  An explicit timeout and RQF_QUIET are set, matching what
  scsi_execute_cmd() does.

- Serialization of the ENE sequence: brightness_set() now only caches
  the colour and marks the LED in a per-zone dirty bitmap; a single
  work item per zone runs one sequence (MODE, colour slots, APPLY,
  SAVE) for all pending LEDs. The v1 per-LED works could interleave
  their sequences between concurrent updates. As a side effect,
  multi-LED updates now batch into one APPLY/SAVE.

- Subject line: switched to the leds subsystem prefix and
  capitalization.

- The attach success log message is gone.

Two of the reported items did not hold up against the kernel this
driver is built against (7.2.2):

- kzalloc_obj() is not an undefined macro; it lives in
  include/linux/slab.h (since v6.17).

- blk_rq_map_kern() with four arguments is the current signature
  (rq, buf, len, gfp); drivers/scsi/scsi_lib.c calls it that way from
  scsi_execute_cmd().

Everything else is unchanged from v1: the hardware (ROG external NVMe
enclosures, e.g. ROG STRIX Arion, USB 0b05:1932, no HID, ENE LED
controller behind vendor SCSI commands on the disk's LUN, 4
independently addressable LEDs), the scsi_device_handler that does
not claim the sdev, the multicolor LED interface, and the
protocol handling. v2 was re-verified on hardware.

Known caveats, unchanged:

- the handler attaches manually until a notifier lands
  (echo asus_aura > /sys/block/sdX/device/dh_state);

- SAVE (0xaa) is issued with every colour update, which writes the
  enclosure flash each time; wear has not been characterized yet;

- the LEDs are registered with a NULL parent device, because
  parenting them to the sdev creates a reference cycle that blocks
  the sdev's final release on unplug.

Comments on the interface shape and on folding this into the shared
Aura work with Denis remain very welcome.

Signed-off-by: Liang Haowen <nbg2974@gmail.com>

Liang Haowen (1):
  leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe enclosures

 drivers/leds/leds-asus-aura-scsi.c | 332 +++++++++++++++++++++++++++++
 1 file changed, 332 insertions(+)

--
2.55.0

