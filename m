Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9291B342146
	for <linux-leds@vger.kernel.org>; Mon,  3 Aug 2026 20:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790220; cv=none; b=NR0OIYTc52YRVuleOYh+DV489uNfAnqcYwTfN6ZWTd9hiK8L/dSeK59dB7sXrbQq3VFRHqg4OeFCGAwGfxeMpWoIuuExjC4BOfTxyo8bMQqt4kiX7ukeaVAPbzevN4NoS8A5zSoEwEUJAY2ax7GTjMvRdEUFiNcjuT7GydAzzxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790220; c=relaxed/simple;
	bh=wZ1N2REpOJJNPxLZ9GguARRcKMAl5kI4U1va3fafSDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rcWQIKr7QkjtUV8hZ6xb8KgaMWaujh/0SfpU6bn12fZ4hOgdEJQtg/h6zU4TdmRaiHXTULca9uxO1yerGU89dVoVU49vmOggI/2wXCVOXPFy73djBtzjfGiioXxy4McQ23swTxlc7k2D0QK5hFBenG9M2h672RNwEYq/HOw7b48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3Poe6/S; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3Poe6/S"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e7109321dso2240629a91.3
        for <linux-leds@vger.kernel.org>; Mon, 03 Aug 2026 13:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785790218; x=1786395018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gsxiDzL0I01ABFBzvuI/N7g4tWws5xrBk47m3Bu1XsM=;
        b=d3Poe6/SCVzVH66b7Ra8rqXkXtBg2L3xIicd6+NbV+9zhx4TRLixENlkFBPUiHp3Wi
         NoRPQice2O5wcxd0Y7sCpubqlu80zrBCK+Qt2Lmt6I/yq3GpoBVZX4Gck3f00ROfRRdl
         ay7MQNZjevt5zOlrqGWsnywXYpuXjz2FzZ5kOYRa9Kvq22eHx+hboqq7bkWWR4Y7rgrz
         kq6RaoUcG8e9UOC+f3vlVaAiK6bkcmC8YsfLkwysD/fVbZKWL4HHLEw6fhSyFzE1P3fF
         istdpNUCUZc5M56AIcBzXSKHpp1tshpRtEIZgZk43cHYgCGh0cbDRhEYoKZZM7XeZjj/
         g/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790218; x=1786395018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsxiDzL0I01ABFBzvuI/N7g4tWws5xrBk47m3Bu1XsM=;
        b=PvckHX02u1c1eu1Lpkqz2BN6ncRpkk3yV4shEiU9CbnVEjEma/whqL9KJO96y0l961
         8blVL2wttD6JwRDGBM7G1Z5rBuaGtfeWAAkQLL8o1jl07FAsrARQeFsWOxlAWoYTsHuk
         Wqwtw556Cln8WSSmIKlVurf+x/g+BuUIPbosk113CcBQbhTEFPUDFomitruvr//k8MIw
         9tm8CODSnwRjrVP/OunyAUMzy9mL9nOZtMkQzDteYtv0qALXdwhpiQuMCXM9kPVMVUt2
         waiUV9ZGzR/JhnIMs2bDJwuHASTJ5QzMgTjHP/UftMWZb4Gtph29Mt86ZbLRfWMQpgqr
         rEpw==
X-Gm-Message-State: AOJu0YwUAXJfPlN+Y7qxqBawoXcM4z94YPfzNURFMpfmlbz12+MGcYAE
	GlzLuSxAqqDDd4grWsPYtLeC2YVF2nBcCA93wGJWGFhYu8UL6HO1AIFOQDrxhKdb
X-Gm-Gg: AR+sD106//lRUOyEwsPAN6k1qRI+E8oJjyW7JlOvMjm5E1r299DA9GaqFI/uudT6qmE
	jjklQAKexYp3KPGQ8w0/tO0+WqA9/FynscZ4rAj7cSbC0IJRwEcpIblLEZhrhhZLE9aK5dL4fvg
	uCLhTl05OlbkT7vGawbBU3WqtRHP/Uuo6Pn8EPSBB0yCJKpEj3EmFp7k7jhM71IRBXnsCsEwz59
	BfP3BUXrjAgdVQeOLQTShob1xcuiCbGh/5B/8CzOe1inBSJZo4dja5zCJQjAEkP2Kd7KzPdn1x2
	bqJhOskO+RbTQTvqJQnWNtZppZRubqs7qpBI8hwInGsmPOlhWxJV4xbQ6yKyUo/J+C21pevKJL8
	jvKjIbYYbXQ9WX20gz8Yvnt+Nk2jVmAsZLs+xNwsq7VB9V1RGhnmKCnThsVWRWX6wRLPZFVqkCt
	6BFLkVvoh0jvOHoE3TSFlEneXRWMAW2qIwTSzaqNJITTBScYiHcKDENlBcSWi9e1naxzwmFiOs3
	o5DWHo=
X-Received: by 2002:a17:90b:4a42:b0:38e:3a8:2374 with SMTP id 98e67ed59e1d1-38fbc51610emr9556132a91.30.1785790217545;
        Mon, 03 Aug 2026 13:50:17 -0700 (PDT)
Received: from Mac.net ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4d10bbsm33112324c88.11.2026.08.03.13.50.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Aug 2026 13:50:16 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Nam Tran <trannamatk@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC net-next v2 0/6] ptp: ocp: Add R4006 and V9 I2C peripheral support
Date: Mon,  3 Aug 2026 13:50:05 -0700
Message-ID: <20260803205011.1249-1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R4006 and Time Card V9 place an I2C mux behind the FPGA XIIC
controller. The current ptp_ocp driver exposes the root adapter but does
not describe the peripherals behind the mux.

This series adds the generic infrastructure and board profiles needed
for existing subsystem drivers to bind to those peripherals:

  1. A binding for the Lumissil IS32FL3207 18-channel LED controller.
  2. An IS32FL3207 LED class driver with individual and multicolor LED
     support and per-output current limits.
  3. Software-node propagation from an I2C mux to its channel adapters.
  4. Validation of the fixed-width EEPROM board identifier.
  5. An R4006 profile for its sensors and GNSS/SMA LEDs.
  6. A Time Card V9 profile for its BME280, BNO055, GNSS1, GNSS2, and
     four SMA LEDs.

Profile selection is deliberately fail-closed. PCI IDs are shared by
multiple PCB revisions, so only a validated EEPROM board identifier may
select a topology. Erased, malformed, and unknown identifiers leave the
downstream devices unconfigured. R4006 identifiers are matched by their
R4006 prefix, while Time Card V9 requires the exact "TIMECARD-V9"
identifier.

The R4006 BNO08x is intentionally not instantiated because no upstream
driver exists for it. LED status policy remains in userspace; this
series exposes standard multicolor LED class devices.

The EEPROM validation patch fixes a pre-existing out-of-bounds string
read and carries Fixes and stable trailers. It is included because safe
board identification is a prerequisite for the profiles. That patch can
travel separately through the net tree if preferred.

Validation performed:

  - dt_binding_check, including YAML lint and example compilation
  - x86-64 and arm64 W=1 builds of the modified driver objects
  - strict checkpatch and git diff --check
  - R4006 addresses and LED routing exercised with the downstream
    implementation
  - Time Card V9 BME280, BNO055, mux, and LED-controller addresses
    verified directly on hardware

The complete upstream series has not yet been boot-tested on an R4006.
The V9 test card has an erased EEPROM and was intentionally left
unchanged, so automatic V9 profile selection was not exercised. Its LED
controller responded, but the outputs reported open-load status on that
board, so physical LED illumination could not be validated. The test
distribution also lacked the BME280 and BNO055 modules.

Questions for this RFC:

  - Should IS32FL3207 remain a standalone multicolor driver, or be
    integrated into the existing is31fl32xx driver?
  - Is assigning software-node channel children in the generic I2C mux
    core the preferred representation for PCI-card mux topologies?
  - Should net-next carry the complete series after DT, LED, and I2C
    review, or should the prerequisite patches travel separately?

Changes since RFC v1:

  - Correct the documented PWM resolution and support standard LED
    startup and retained-shutdown state properties.
  - Use a named I2C ID initializer and fix MAINTAINERS ordering.
  - Move EEPROM validation into a separate prerequisite fix.
  - Select profiles only from validated EEPROM identifiers.
  - Rework the R4006 implementation into reusable board profiles.
  - Bound asynchronous retries and serialize topology population with
    controller and mux driver bind/unbind.
  - Avoid repeated managed allocations during retry.
  - Add the Time Card V9 profile, including the second GNSS LED.
  - Leave the I2C mux software-node propagation patch unchanged.

RFC v1:
  https://lore.kernel.org/r/cover.1785684064.git.ahmadexp@gmail.com/

Ahmad Byagowi (6):
  dt-bindings: leds: Add IS32FL3207 controller
  leds: rgb: Add IS32FL3207 controller driver
  i2c: mux: Propagate software nodes to channel adapters
  ptp: ocp: Validate EEPROM board IDs
  ptp: ocp: Add R4006 I2C peripheral topology
  ptp: ocp: Add Time Card V9 I2C peripheral topology

 .../bindings/leds/issi,is32fl3207.yaml        | 208 +++++
 MAINTAINERS                                   |   7 +
 drivers/i2c/i2c-mux.c                         |  55 ++
 drivers/leds/rgb/Kconfig                      |  11 +
 drivers/leds/rgb/Makefile                     |   1 +
 drivers/leds/rgb/leds-is32fl3207.c            | 580 ++++++++++++
 drivers/ptp/ptp_ocp.c                         | 871 +++++++++++++++++-
 7 files changed, 1687 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
 create mode 100644 drivers/leds/rgb/leds-is32fl3207.c


base-commit: 69963a0678a347d57c4ac8b16939dba216eb95ce
-- 
2.50.1 (Apple Git-155)
