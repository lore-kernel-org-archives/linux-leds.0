Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6396637A84F
	for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2026 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544242; cv=none; b=SLDa94QArmV8iyTfm7S2+RcW7rE0NYyDujX+Tup0MXOuu3D1zkglGy0QsJHsCWN1ScqLvTNXA4QpRfO7uJJjwOujZHNll1gE0uyCS38AwFdCMdSLE90lWNbBac0E1kaiZAGqSsZMfgG5fXA9CzhvvD+gQ2lye3mtQzHmQLbdIAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544242; c=relaxed/simple;
	bh=lW7zxZqx7Njnrn6nen+3u4o3GCHZTEp4Ur108DTPK9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MxPyOTtbsoj7vFdAGzZsFzv5W6pb4J7njnEiLQB3tZgTi4Xh3WDGpm5NEapMa6PhHY9ak/wmREv8O0Y8So+r8q4jO+zgCy6zFXMn/GPPtn77DQLxZTEmpovAsaJP+4rugC5rf06CNP0GGwiBP6nnWnXINJIqSBoIiqv2O0Znwhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRI2Q9LF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRI2Q9LF"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38511175ad3so905282a91.2
        for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2026 07:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544240; x=1787149040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFXEKRNC613kArjQkSDoySIwrg59q2YplhF5qCQ3nq4=;
        b=KRI2Q9LF4g3P4OMFeOJUK/d89oCYcE5+83T1f8eTz9ptO3qQV6VH8+wPe/hg2/ND9M
         knRx4CX/cBjsbaHHMaCpyUosGQduuOh2B655d2ZG9T28mFgzcgi+iUjfMnvHnBXVRvLE
         +S5sH3VvkIQn/NgMOzxcIRdXz3/Y2kKtMwVSW3OgTAsRwk7Xd4EnJ9WoRINIAaJR6Zo8
         0+TFRUnuy3JypNn580IfCNqn4B3mAxQ+bgwxPBlWU8Zcz9xzUFzHevAwxs9brraTCvdp
         WsCjVdv2ke/6feIWkcMR7naRq9C/bFodamOuAwqSnS+FjSkka/YB/jhHkyWTpcuM8YCm
         y2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544240; x=1787149040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFXEKRNC613kArjQkSDoySIwrg59q2YplhF5qCQ3nq4=;
        b=CuD57AYlGkX/ZLRLLVMP4V2joky722LSpbKWLKBUAq2ykBlOYOpCLs+ZViKaJ8IEA+
         yH/rjmD5xj4qP7VaiBFIHtRol4woNeUff4+ctlDxnP2nyDYDQxtZuii9/UrODM9KUqek
         XxhSH2vPgi3Xd3+gu7VcCg4xJcIm4Ck4dyDg9umRHlZTfzwumt1Atkmg1ebDuxzKJ1IH
         FIihCF6bfX/Bs/NjR3ag2i1COXtRCI5avwEtIPhXBbPemrrvOsvQlBssiFEbHyBGmcPy
         81nS2078kGmkFRA/KyhYCH3mN24xOT3V7e0boVw9muuLyzUefjBWsBj7exqp8sRLEcJD
         to+g==
X-Forwarded-Encrypted: i=1; AHgh+RrWE9nx0JbfTji+0vL/gN5OzPzXReNGhWm2/Jw4FHZaOJHTg21SMDfMG2ptUxT/Pc8QD0iJhxvSu3YM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4N7a0v+M2tS3NprQqdBXPLMssDdVKlOKiptBVHRCAzUEi0+Dq
	xiVp/WIHQ5vIq1gtB5rPeA5ghJrxl18q0KjMii1hCkUtsZFuTrYSazFi
X-Gm-Gg: AR+sD11+nkbXEinXxiegU4VmdJ5XRnAcCZizQX4t0p8OqeNgbKdGWFdF9CW1BSWxCjC
	EUxksumsL99j6VWcS2GRe+Pe/uYxRmxpC/Y3twXzHhQpLeVgYk47bGr07JDmyVR8KYV/iAr6faQ
	+QoBXfBJlUrFSfffdy3BSZA2iE2CFFS0fZMCq1euX0qULnbSerRD2xVTj8so6IbMsox4BHRU0B/
	e3zoOIiNCfnoSGqs8lfSAgDw1S//aPFEFM4cPg323rwMDZxUVplYUQMXOpLDIJFjIk/kEwvBdmI
	Tjg2rJEaoVDewDqTqsGrNqf4RyHC031Om9qU83wAZ8NohDKIhSUlTBxrVjRPvrUSRb5EOifxAgy
	wUc15iemKQxFJwUp9qYp/oKv9IelYij3LPqdpxgS3J4/2g/EmnVCMZX2kLWHOTM2rxyI/va1ll3
	rhdAgrxjgFiwkn7Zv5EDNboxl+rnCJWq+eogIeb9u8pvIywvDpCs3OlQFhRVi6Bq9+X2+Tt0MUF
	MIvrbpcuCz1517eK9B7tiJMRkWjrfjwTF3ruFckcbffUAzNkA==
X-Received: by 2002:a17:90a:e7c6:b0:38f:57f0:1f5d with SMTP id 98e67ed59e1d1-3930164ea38mr5615471a91.15.1786544239634;
        Wed, 12 Aug 2026 07:17:19 -0700 (PDT)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf361d57asm11963071eec.6.2026.08.12.07.17.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 07:17:17 -0700 (PDT)
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
Subject: [PATCH net-next v4 0/5] ptp: ocp: Add R4006 and V9 I2C peripheral support
Date: Wed, 12 Aug 2026 07:17:10 -0700
Message-ID: <cover.1786543681.git.ahmadexp@gmail.com>
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
    and arm64 using both defconfig and allmodconfig.
  - Ran strict checkpatch with an 80-column limit on all five patches.
  - Applied the generated mailbox to the stated base and compared the
    resulting tree with the source branch.

Changes since v3:
  - Carry Krzysztof Kozlowski's Reviewed-by tag on the DT binding.
  - Document that registers remain accessible with SDB low, preserving the
    retained-scaling clear before hardware shutdown is released.
  - Establish any ACPI primary before attaching the channel software node.
  - Keep channel software nodes attached until child clients have been
    removed, then release the held node reference after adapter deletion.
  - Rebase onto current net-next.

v3:
https://lore.kernel.org/r/cover.1786423898.git.ahmadexp@gmail.com/

Ahmad Byagowi (5):
  dt-bindings: leds: Add IS32FL3207 controller
  leds: is32fl3207: Add controller driver
  i2c: mux: Propagate software nodes to channel adapters
  ptp: ocp: Add R4006 I2C peripheral topology
  ptp: ocp: Add Time Card V9 I2C peripheral topology

 .../bindings/leds/issi,is32fl3207.yaml        | 251 +++++
 MAINTAINERS                                   |   7 +
 drivers/i2c/i2c-mux.c                         |  71 +-
 drivers/leds/rgb/Kconfig                      |  11 +
 drivers/leds/rgb/Makefile                     |   1 +
 drivers/leds/rgb/leds-is32fl3207.c            | 691 ++++++++++++++
 drivers/ptp/ptp_ocp.c                         | 881 +++++++++++++++++-
 7 files changed, 1865 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
 create mode 100644 drivers/leds/rgb/leds-is32fl3207.c


base-commit: ac155a26750a595703e7dadff84735456d75a479
-- 
2.50.1 (Apple Git-155)
