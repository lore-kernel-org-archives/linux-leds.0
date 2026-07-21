Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF964499AE
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627593; cv=none; b=FY1lif13xaYHkFZ7aFd7jOCyUmOiFiReJxW981Yc07oemEiW3gOKLFefE57gpJYNfl6bKoPZzH+OuL+whq5bsuOf79aXaPAMHGVusqN17p/4ySwcwBPs9snh6H/OP4cKYzccEl88pOJZIuBklUKP16vT4f9gVElp+d0qy5G7V4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627593; c=relaxed/simple;
	bh=qD30dQmKclQ0zx8l1do2zkJv1Fkwy7bpNlXAdgXoaxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hayqWGYmJN0gWD+SSxCO5uJpZj8EbJPU6Lgh2aFUN7DijNgYAtEgLukuWdQXZfH2n8Ntg/wM14CJkOKWoyS2Y5qfF5P+ScuRwwvoQ+y9gbMUaqkZfkUerKNw2Axk8PIWV89wY1r5MmNSmj3qTF9h4ZAHm2NR98QGGsewkJeEkFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPP/gHKK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPP/gHKK"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49547fc63a0so19692685e9.2
        for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 02:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627589; x=1785232389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+/eOTpenNfUjFPAzBL9uoyeNDvjEemJNpe8zs8B/A0=;
        b=KPP/gHKKqbilDuQ69li2+wcdEqNqffeOtQntyBJg/Wu7dR3knq7PSRGQrHYMg8qX0X
         Vr0hi1QYLR7mZJsewkGI0Uo/KOOZKyEQc6DE6sJ+82x1loM7gNXQ9PXqQ98YLnxgav1k
         I3fZYgeaTOvXy1D1a1KxpxzJQXqTrRdAlQaFfl94mx83NRDMHGv/GYX1klBJBlN2tfJg
         zlWqa/iT4JBvQ/mdKOYvWNUIHGr2AtSxJquHqGkSHPzDlu6omdTJhO03UYX2HlEDzDqv
         EI9GzkucEEdIayvZh+k+dk4Qii8kYz+72Hq9Rowt/zzT3AuXNgcvdRt3O99spQwhS/5T
         yWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627589; x=1785232389;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H+/eOTpenNfUjFPAzBL9uoyeNDvjEemJNpe8zs8B/A0=;
        b=R1CnrrSpQTYmJHd6GOcGkLmI5dg3OvuN2sMxnpV9UX89NljWSFchTQB3ty0ODEUPzX
         POd9SKl1v1rdFkjvnLEu6WoaxkWM5Q8OFeIKANkTzh+znzimQc2nlTQ4pR15uG2jBRnN
         AHq3a1TMd0fynEgBdKw03H2tYXkXGpcURzOclu+yM9H2wVWl4EBYx4PPQtOlv5khjWCv
         hXLzrYLgOMHTJol2llRWzMxRMybzmeKhZNG38WZm9IZp68WWtcIExcou9jaioSPzVsiR
         MrGfdQY7Dy0yE59wKoD6Z+o/TN9BNG5M+7BA13lA9dGyP5K0sGiWWMXsvJZ015280k85
         tNwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpn/UkBUi+1FdC55RlKxMosjKWNxxWckZor0GyaJk+zKrKXUx2azJipEWM547Nqvw6e2e0kXYRyzGdx@vger.kernel.org
X-Gm-Message-State: AOJu0YynpQOufmviYbDvNz7aliaOsvO8s17jNdsFGJ8eUVyHWGKPi/mn
	eZd/Rs8t1DWOiy2d3Zp7oiTXzsXyPR78hIQMO/XxMflMHJgsZFmqqLcE
X-Gm-Gg: AfdE7cl2TLOOAyRlZi0N4yIMdUPpIn7/hgMsUU3VifsmprSpGCxt9GTRysldFM/hgVs
	mY+Iw3OrOnKvo7cPrQT8wmlGEO6BzqHey/GQlU26HWjkUHxouOBCHwggnP2IKpLS1hqy8hW9azo
	TlvV4bwsZhU+SXdhfX6z76K7rcnmpWOjR0rFGAuA4enj6LBWFZ+bNvZiVYHpL4Nuap3jJa1Yz0U
	Ps6fM/msjEpCRWUMBg85SNLTz7xc4yBA1nJAood5dBDnCEzfJyZoiqU5jG/XyYE8WhtlYoLvbhL
	mAL+MzEA/AMUWC1E8GdgOviZHpon1sIJJWoMXu2ngeXM26YY2PKesnb0A/AdIUou2R1TZfOd8gt
	3kwxB+yT+bsHsfRyQucSt4Lofe+GGrIL1byoR3r7SV7hyBCmuIidZU6Ky3F0GYFTOKn7sW89PrN
	4GKxvVuJ9hIN2El8aJ0kfDGJ0=
X-Received: by 2002:a05:600c:4f12:b0:493:f0f5:f2d2 with SMTP id 5b1f17b1804b1-4954a3d0ceemr213824335e9.1.1784627588295;
        Tue, 21 Jul 2026 02:53:08 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49565482c5asm82834285e9.10.2026.07.21.02.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:53:07 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v10 0/7] mfd: Add support for Asus Transformer embedded controller
Date: Tue, 21 Jul 2026 12:52:26 +0300
Message-ID: <20260721095233.420823-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for embedded controller used in Asus Transformers for
managing power and input functions.

---
Changes in v2:
- converted sysfs debug exports into debugfs
- added kernel-doc comments for exposed functions
- fixed minor typos and inconsistencies

Changes in v3:
- dropped DockRAM commits (both schema and driver)
- integrated DockRAM functionality directly into the controller driver
- EC schema moved to embedded controllers folder
- removed all cell descriptions from the schema
- removed all compatibles from the cell drivers
- adjusted naming conventions to better align with the ASUS Transformers
- defined EC variant sets to provide coverage for all known devices

Changes in v4:
- grouped known programming models of EC chronologically (both schema
  and driver)
- call debugfs init only if CONFIG_DEBUG_FS is enabled

Changes in v5:
- added asus,tf600t-ec-dock compatible to schema
- rebased on top of v7.0
- kzalloc > kzalloc_obj in keys and kbc

Changes in v6:
- removed asus_ec_handle_smi casting
- asus_dockram_access_ctl > asus_ec_get_ctl in control_reg_*
- fixed battery Kconfig description

Changes in v7:
- added status check of devm_kasprintf where missing
- devm_asus_ec_register_notifier dropped, added .remove where it was used
- removed cell_to_ec, asus_dockram_read, asus_dockram_write, asus_ec_* public API
  asus_ec_i2c_command, devm_asus_ec_register_notifier, asus_ec_read, asus_ec_write
- renamed asusec_info > asusec_core
- ec-kbc: added packed size check
	  ret > error
	  improved key remap logic
- ec-keys: improve formatting and comments 
	   ret > error
	   switched to dev_err_probe
- ec-leds: reworked to register both leds via loop
- ec-mfd: adjusted Kconfig description
	  fixed smbus operation sizes
	  fixed saving of EC fw model
	  adjusted IRQ flags
	  converted to use definer for set cell composition
	  added factory mode states enum and handling
	  defined some "magic" values
	  self > client, info > ec, ecreq > ecreq_gpio, priv > ddata
	  asus_ec_chip_data data > asus_ec_chip_info info
	  ec_data > ec_buf, ctl_data > ctl_buf
	  added and improved comments, added structure descriptions
	  asus_ec_magic_debug > asus_ec_susb_on_status
	  removed all dev_dbg and most of dev_info
	  pronts with model, fw behavior, factory and susb state preserved
	  switched to MFD_CELL_* macros
	  removed debugfs
- ec-battery: swithced to BIT macro
	      lock usage moved to asus_ec_battery_get_value
	      in asus_ec_battery_poll_work fixed possible rescheduling fail
	      in asus_ec_battery_poll_work fixed missing not charging
- ec-charger: POWER_SUPPLY_PROP_MODEL_NAME set as the first check

Changes in v8:
- added MODULE_ALIAS
- renamed DOCKRAM_* to ASUSEC_*
- ec-keys: input_handler moved into private structure
- ec-leds: added brightness_get
- ec-mdf:  fixed i2c_smbus_* return checks ()
	   improved model storing
- ec-batt: added status check of devm_kasprintf

Changes in v9:
- fixed i2c_smbus_read_i2c_block_data return check
- blocking_notifier_chain_register moved before serio registration
- adjusted get_unaligned_le16 bounds check
- unsigned long long > u64
- iterator vars made scoped
- removed "magic" values from ec-mfd
- simplified logging, detect split into detect and init
- improved error logs formatting
- adjusted handler in media keys to connect strictly to dock keyboard

Changes in v10:
- ec-kbc: fixed possible out of buffer reads
- ec-kbc: set notifier_call before blocking_notifier_chain_register
- ec-keys: dropped input_unregister_device which should be handled by devm_input_allocate_device
---

Michał Mirosław (6):
  mfd: Add driver for ASUS Transformer embedded controller
  input: serio: Add driver for ASUS Transformer dock keyboard and
    touchpad
  input: keyboard: Add driver for ASUS Transformer dock multimedia keys
  leds: Add driver for ASUS Transformer LEDs
  power: supply: Add driver for ASUS Transformer battery
  power: supply: Add charger driver for Asus Transformers

Svyatoslav Ryhel (1):
  dt-bindings: embedded-controller: document ASUS Transformer EC

 .../asus,tf201-ec-pad.yaml                    | 119 ++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 .../input/keyboard/asus-transformer-ec-keys.c | 310 ++++++++++
 drivers/input/serio/Kconfig                   |  15 +
 drivers/input/serio/Makefile                  |   1 +
 drivers/input/serio/asus-transformer-ec-kbc.c | 168 ++++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-asus-transformer-ec.c       | 125 ++++
 drivers/mfd/Kconfig                           |  16 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/asus-transformer-ec.c             | 549 ++++++++++++++++++
 drivers/power/supply/Kconfig                  |  22 +
 drivers/power/supply/Makefile                 |   2 +
 .../supply/asus-transformer-ec-battery.c      | 289 +++++++++
 .../supply/asus-transformer-ec-charger.c      | 208 +++++++
 include/linux/mfd/asus-transformer-ec.h       |  92 +++
 18 files changed, 1940 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
 create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
 create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c
 create mode 100644 drivers/leds/leds-asus-transformer-ec.c
 create mode 100644 drivers/mfd/asus-transformer-ec.c
 create mode 100644 drivers/power/supply/asus-transformer-ec-battery.c
 create mode 100644 drivers/power/supply/asus-transformer-ec-charger.c
 create mode 100644 include/linux/mfd/asus-transformer-ec.h

-- 
2.53.0

