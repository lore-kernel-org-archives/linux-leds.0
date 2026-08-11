Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A8D2C21DD
	for <linux-leds@vger.kernel.org>; Tue, 11 Aug 2026 05:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786424571; cv=none; b=BSYIcqxSXPvOs+Nl0SmRaUfF5LHeE84AIAGpWebmUMtSRoRqGt20th1bPv/P6A5OV7y5gGRxJtDpP4wEC1BkaA2NyObvlEq+x6zT38jNz07k5Y9C2fC7ugVpQPq6mIlOWEY7OPWAUkTcRKV2MgN+p4FtyNeLfgnkhvdcHmxRdrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786424571; c=relaxed/simple;
	bh=0XOITciiOnBra/r3Ajx1I6Wub7Yecid0iLcQTSs3v3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N5odeP+lbpUNHagiOfoRFLjiea7SeG21g3haDdBqQm/GitgQEgVcMuZOqsG3lsVVG2GqFjzvPdl98YQ0Ch71mOrcVV7GGyzgXl2/orSj/XDbCrmEZ2sA6S0Ojuwtp8/fIQEDqRDcZwQzlVUCtbPzosCPFS6h8LTvMTlYrOVVzO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xvzb3w7Z; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xvzb3w7Z"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cacb8416a1so26829385ad.1
        for <linux-leds@vger.kernel.org>; Mon, 10 Aug 2026 22:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786424567; x=1787029367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7O7xUkoYVY8AeKODvISm0XPf0ZextZDIpWMTL9lvpDk=;
        b=Xvzb3w7ZLk6dETwQdORGpKtV0vwwKLDWbylROHo7Us7vXc8RrMCcRwoNLFWiY1soPM
         yNZGhJpER4bwG9pMH8mHmcCrhrIxBhgnOTWStP1PWGtdacc5TL2imElITMqDqJRV93r/
         wFbAjW6TKRZQsGoCKdyNSQ6fm74AicspL3kIwxWZwe80H+jv1DNzSffqHA9K6YmM0Hx1
         4a5WlbW6DD7fPU/cFAR/IO9AdYqhb7mlz3t81QMTXe11WnH2cUMY1PkxeyBMJcJB2Yvz
         9M+auKNTLD1z7fFwZgWJUFPXVn4+4MbUPnsLVo7nOM1tU0Gb1cT9sxyTzRJY8uJnl2rW
         PBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786424567; x=1787029367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7O7xUkoYVY8AeKODvISm0XPf0ZextZDIpWMTL9lvpDk=;
        b=P4TNwI0IDoukCAp10pv38PTm/oFX+NjcH6baG/MwFb04zQMz99lHBSrbWUGLdbbtpl
         /DbKdcw1ZJiRPTJPwPbhNsth4ZPYFF6lvGVB5V2qZ6WpHsXCJRQFR/gQzr2L7B1dWuCL
         iZk/KvWeF7skjn9ROWUydyjQjEo2tvyMiM/HIRYWFto6wC1qLPNX7kflvoqcV56IfLy7
         sLT7S4ggDzEW/5i9KmHGohNqvoFdNdxkbxKim2YeRAz0FvQRoG5U8FC10jxS9uUxy1J4
         p+ljn3RIw+mSdfc32hnqbZH6v3TUJqudn6c1nELd1LI5o5c0QbQoI7NG+fuokBSzkk6o
         FopA==
X-Forwarded-Encrypted: i=1; AHgh+RplsClftXhfLfC4enHxhHPe7B+Rg/YpRjz8OE5o3EXx78Jbb1NJ2VXG79x1PHCUsDJuUnj0NyMgeM+K@vger.kernel.org
X-Gm-Message-State: AOJu0YywPR754+dFD26g1d8VMjt8ouAynL28lKE6UYiH51EJMY87DjVS
	0eFiCl+fiiBpvJBEslgPBsITA1tL7LIwb3CCl5wJKA+vUmN/PI8c6dnd
X-Gm-Gg: AR+sD12S1hIEU22wyF7YSKsBVq0HcmPEDCxfpSiy0/So4qpitvhu9YLeOMc6qa6BfWT
	qA7e9YH97WkVfx03ISnSILd61tTeCYMs4d45f2EjFOPYVAgQuE2g8GBJ6LPQ/Hh0TgCOKamAHyH
	Cu6GgLXmrbb8F8n2+AL/Y7sZL+BugNPXliqL7W69kLS5A1nvpMX3357cqJjixHkeE/jMyqvhwze
	TjGswO2fxabUNM2nC8dQ7INxnG4y8LJ5TmexgJJ/yGsIpugLc1gN8iGI78qB9Tk/gJC/YIj+IJ8
	GpjZXSI4mJtpkb/gFlKQCek1GaEqSvzU98+9kOgdc2uAs2tbORgdeOXXRy3VYtqesIeEkTJfS42
	uP9Ov81z4KECkfBoX5fji2dvWhE+k8e2PK2Ho8UrLJIEwx6b0rPFbHMgUgBL9nhNi8Edu0CiWGG
	9lrpdk6hhfn/VgmxJk1m7wbwPYomu3Cd5uXExh8HYNQtD57A4ZALtqlPLdyPs5fvEccgHyzgB8D
	9PQOD3QHh4nEiDCEjAqX5qEDzptyouK05Byk5OH1NQiC13vbQ==
X-Received: by 2002:a17:90b:4b0c:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-392ec617514mr576960a91.19.1786424566907;
        Mon, 10 Aug 2026 22:02:46 -0700 (PDT)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c619cf07dsm660421eec.4.2026.08.10.22.02.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Aug 2026 22:02:46 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nam Tran <trannamatk@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH net-next v3 0/5] ptp: ocp: Add R4006 and V9 I2C peripheral support
Date: Mon, 10 Aug 2026 22:02:39 -0700
Message-ID: <cover.1786423898.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the generic LED and I2C-mux support needed to describe peripherals
behind the FPGA I2C controller, then use it to instantiate the R4006 and
Time Card V9 board topologies from software nodes.

Patches 1 and 2 add the binding and LED-class driver for the Lumissil
IS32FL3207. The driver supports individual and multicolor LEDs, enforces
per-output current limits, and keeps the controller shut down until every
channel has been configured.

Patch 3 propagates software-node channel descriptions to adapters created
by i2c-mux, including a software node attached behind a primary ACPI node.

Patch 4 adds the R4006 profile for the temperature, humidity, pressure,
GNSS LED, and four SMA LEDs. The BNO08x channel remains empty because no
upstream driver binds that device. Profile selection is fail-closed and
requires a supported PCI device plus a printable fixed-width EEPROM ID
with valid padding and an R4006 prefix.

Patch 5 adds the V9 BME280, BNO055, two GNSS LEDs, and four SMA LEDs. It
uses the exact EEPROM ID "TIMECARD-V9" because earlier revisions expose
the same detectable I2C devices with different LED routing.

The prerequisite patches touch DT bindings, LED, and I2C code. Reviews or
acks from those maintainers are requested so the complete dependency
series can be carried through net-next.

Hardware and build validation:
  - Exercised the R4006 LED routing on hardware.
  - Checked the V9 controller address, 4.7 kohm RISET, sequential RGB
    routing, and second GNSS LED against the V9 schematic.
  - Ran dt_binding_check for issi,is32fl3207.yaml.
  - Built i2c-mux.o, leds-is32fl3207.o, and ptp_ocp.o with W=1 for x86-64
    and arm64.
  - Ran strict checkpatch with an 80-column limit on all five patches.
  - Applied the generated mailbox to the stated base and compared the
    resulting tree with the source branch.

Changes since RFC v2:
  - Drop the board-ID over-read fix, now upstream as 6b69f2ef10cd
    ("ptp: ocp: Fix board ID over-read").
  - Fold non-mutating fixed-width ID validation into the R4006 topology
    patch for fail-closed profile selection.
  - Clarify zero-based LED outputs and correct binding color, naming, and
    nonempty-group constraints.
  - Use fail-safe LED reset and enable sequencing, serialize scaling
    writes, validate node structure, and use the driver-specific subject
    prefix and private-data variable name.
  - Preserve secondary software nodes behind ACPI primary firmware nodes
    and balance their adapter lifetime.
  - Validate profile indices and make mux channel, RISET, and current
    limits explicit per profile.
  - Gate topology work before EEPROM access, avoid core device locks around
    client probing, and continue low-rate recovery after retry exhaustion.
  - Confirm the V9 address, RISET, RGB order, and second GNSS LED from the
    schematic.
  - Resolve every 80-column warning reported for RFC v2.

RFC v2:
https://lore.kernel.org/r/20260803205011.1249-1-ahmadexp@gmail.com/

Ahmad Byagowi (5):
  dt-bindings: leds: Add IS32FL3207 controller
  leds: is32fl3207: Add controller driver
  i2c: mux: Propagate software nodes to channel adapters
  ptp: ocp: Add R4006 I2C peripheral topology
  ptp: ocp: Add Time Card V9 I2C peripheral topology

 .../bindings/leds/issi,is32fl3207.yaml        | 251 +++++
 MAINTAINERS                                   |   7 +
 drivers/i2c/i2c-mux.c                         |  69 +-
 drivers/leds/rgb/Kconfig                      |  11 +
 drivers/leds/rgb/Makefile                     |   1 +
 drivers/leds/rgb/leds-is32fl3207.c            | 687 ++++++++++++++
 drivers/ptp/ptp_ocp.c                         | 881 +++++++++++++++++-
 7 files changed, 1859 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
 create mode 100644 drivers/leds/rgb/leds-is32fl3207.c


base-commit: d67e5dbda22604d0fcde32fce58c65f88676e676
-- 
2.50.1 (Apple Git-155)
