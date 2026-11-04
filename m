Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795186;
	b=lhHhBQKYynSWd64WNxU5Uq+6qPdqLnLvmtJtYu26l+iB7MEthbmxClPFx0grWSi/DsmF
	 27q3UauwWn92oZJsjIG/REJ+SY+0nh/abU5R05NTKgtK0dMZOccU7EfuBqJdnUB32f/ac
	 iftrWBzUw0QIvzswXSTWSBvJY2LrVttyXcR2SOkSj4E+6IJI2/Z3ApxBwW5metZYygj9c
	 y5JnHxiAiMYTOeH7yc7drpJ9N8mMxMm1lYxrng4gxD0JgHyy5quNoXoAyeuo1uFy+HVPG
	 LbaFhYVRQVTgOewF4zMNK9ZOyCF5t9snpdXMjIiXaXgM/eXgmorsFbQWzjM5GrnCPKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=thomxBGmhlzEQD85NB4cuQLLeHvP2M634LL7QtV22Rw=;
	b=WjfSs3PfgHVpf44bwMsm9HKhZxnBSBckZqQAZpC4BkqOyMhlQhK0Grxf8K9XJsnZsMOx
	 SLrTvLZQ+uQpZj8PFULTdWcQ0qD1gnveNXTWawS0zWUsKICSgMpb/8kUGew4xesftsqwN
	 SLKNOervYKHq828HuJ2WBEJNg2xEyYP+ACiXSN3wcI49VpjM5yWLbAflyj1RYXuSbWCc7
	 opCPblxJqoFFej1qAGGsuUtTXr55KvmadsmytmgDRO6VwQuGziAY26qDgLBsYcTkA7MWR
	 JcWQD0N8zg3CvfO2T6mNAjkCzQ1810L+xBdBGkeFWpI0I5k8tUfF0n5in1bqrRlzO6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HRBcL15j;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF4C606A331
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 12:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF4C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HRBcL15j
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214af2076so4314795e9.0
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 04:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795184; x=1794399984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thomxBGmhlzEQD85NB4cuQLLeHvP2M634LL7QtV22Rw=;
        b=HRBcL15j+yHMy3baKSzZG+feycDT3bLz/2Py0auzYiUnpUrrwKeNmbv2D93vhW+Y6y
         4GFqlUTeaAxVs9Ja5WdO7TxR7CuFlucR8E9ngwCf3jN78C+Iad65or/2zRQV5tOXzDdl
         baL5Y9sPvdHOysZNSsz2mrdqfUY4TPoe8QcRemBMDZAZ9pvOqYezCN3Kt9v01FO2hm7A
         /vACd1WxhJGMCaIb0SheVEM4alHwz/yJNILaKigsl6JE4hdJGYjj7R7Lx/K6B9+e5f6O
         A493Gudgn/Ervo4IDnA9vrDfTX28gDzpeqQwRkVCanlMTpy1m2K9BlzF7fOANqCa8C5r
         ffmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795184; x=1794399984;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=thomxBGmhlzEQD85NB4cuQLLeHvP2M634LL7QtV22Rw=;
        b=c+0QePdo+nNGkmhZ5A8pR/YxJwfQ3G3jy2mo74Uk1bmnws453lr460UOWq6ngQG3g6
         wkL9nFXvyLh4WrrCOV5IK+ZC8y6e75sAhgPeZDj8sgHP01gccnZclzPFwqCB8c/liJsH
         4yp/cLQlRr3y2Ch6stgd70hKNtzr3j1SI8CXv12yzBZ4tvP+Faz4roAm+NtMu8pk3y4P
         8Yi20fAXRQy7wwd33G1f5Qe9Gv+mAYKJzlEWwkoS34HrFl6+Chqn43WQL+GGTubU3+DT
         y4v0lwVuvlLfB6Vlxf/Sbfsjb9RfVyvtrJOORHooICR6OWoBIIkGnyZPlljw963aanOg
         a5iA==
X-Forwarded-Encrypted: i=1; AKwUvBzeRNIEwzMkY4zBJWkIHD9m4XBLYs18+w9TQYiF2tFHkVqmmHv4TS0qMNtPFFKeSFfzJp5GgVVjID3V@vger.kernel.org
X-Gm-Message-State: APuU4Z9MdmtRm6iOMJB6Fr4sXCg2rsV8sY/+MuXIpoGsn+PqavghJULk
	G8gBAwHohk9QrbyEog34pJMx55Ih0xdonuO4x1p3T7Ss3MpV3p29s0H+
X-Gm-Gg: AYBFou0h3TMzG22Ltuyes8xnckqa1EMJ0EqkJ+PuguXnCoETrmqz/piFA+pncRsDp3m
	8nlBce+8y3Nmw2KI1ftZGQ1l7sPIJtvbZOytKnEgv+5jCgn/jCbj8NOuibZnhekI7oMYXstJ95+
	t7Qla+WzgwFULGVcz1VDp3F/H74FW7cMJ7gjEu5h+9qr/JgI1mMYnHijv8NpIMiu6FJfsPQlrl5
	QhgTUDzjd8CxtJgDI82p9Vzb1x//khU0xXJtCz1r5l0wFEgw0yrzvBSoFGYFYpQE6bn5d7HzK40
	oL8Hc5eifikxET7tzaVJzDkt5azym2Lyc6AJ98GlNjsAA4ign5e98rcK4+NcUm7YpjS4nwP1PNM
	TZOC5zWQieWLprqiiC01YaQa8YanSgFT2c6FEQwwhcZ/oq31h9GavRo+ZBF4HMGspYZ7PCZl95/
	6DX6h7zn2u0VhZCrE537QD7fsMWscy316S0ydTQzMsIGKai4YshvdWMIVs4sV8RcKJDxqVpiy+p
	W/rv7Oi/DAlQ4knzyWDoqYGuXdo/ZxyqTeRYUr5WVyRu/JmMHk+t5HEgte6Rsz740lZiQ1Lq8E7
	GS2qKFQqKQR6W85hjleMNSXOR6P0rCc9Uu/0JWoKXeU//nJcPQ==
X-Received: by 2002:a05:600c:a30a:b0:4ac:b0b2:fa12 with SMTP id 5b1f17b1804b1-4acb0b2fac0mr259956635e9.1.1793795183945;
        Wed, 04 Nov 2026 04:26:23 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43da9825bsm50492415e9.15.2026.11.04.04.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:26:23 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v13 0/7] mfd: Add support for Asus Transformer embedded controller
Date: Wed,  4 Nov 2026 14:25:59 +0200
Message-ID: <20261104122606.215629-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
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

Changes in v11:
- applied changes from Florian Krischer (read_size parameterized and fix keyboard response framing)
- ec-kbc: switch notifier and serio register calls
- ec-keys: used WRITE_ONCE()/READ_ONCE() for priv->special_key_pressed

Changes in v12:
- removed unused includes
- fixed kernel-doc warns
- added check if dockram client and data are not NULL
- replaced handler in media keys with Dmitry's implementation
- calculate battery time props with unsigned value

Changes in v13:
- switch to PLATFORM_DEVID_AUTO
- move notifier registration into input device open()/close()
- remove code check in asus_ec_keys_setup_keymap()
- register notifier before serio ports
- wrap mfd and leds at 100 chars
- moved retry in asus_ec_reset() into loop scope
- removed asus_ec_leds_data from leds
- removed platform_set_drvdata form leds probe
- iterator remains i becuase name led is already taken by struct asus_ec_led pointer
- unfolded driver struct fill in led platform_driver
- minor formatting changes in serio and keyboard drivers
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
 .../input/keyboard/asus-transformer-ec-keys.c | 216 +++++++
 drivers/input/serio/Kconfig                   |  15 +
 drivers/input/serio/Makefile                  |   1 +
 drivers/input/serio/asus-transformer-ec-kbc.c | 258 ++++++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-asus-transformer-ec.c       | 114 ++++
 drivers/mfd/Kconfig                           |  16 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/asus-transformer-ec.c             | 551 ++++++++++++++++++
 drivers/power/supply/Kconfig                  |  22 +
 drivers/power/supply/Makefile                 |   2 +
 .../supply/asus-transformer-ec-battery.c      | 289 +++++++++
 .../supply/asus-transformer-ec-charger.c      | 208 +++++++
 include/linux/mfd/asus-transformer-ec.h       | 100 ++++
 18 files changed, 1935 insertions(+)
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

