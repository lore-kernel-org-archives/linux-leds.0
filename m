Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B0C3B47F7
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627831; cv=none; b=BcyOyNNna8zwZUz1w4mJylOmy93VtT+jr3DmL4FRaOb4msLJXZ2gsmZ4H2TTQaT6K01VqAx3zpj71kPl/CS2Z0b9gKZweLgNEZf0vuOdna6dgfbmGUvAaotDUsJ/vxV4AOBOKPc45mXtOVm59/b80DSA94w0KT0cQLEqNi9RGf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627831; c=relaxed/simple;
	bh=zZG0SwXpBaudvhL8T1nanzDcag2V5GkwhlyQJoKbJVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=omGIXHfDY8EzUQAJui06Ka9pwJv4xGx5H25Wi5sym8eisrF9qSHa/Kv5KbSkMm6uUlbQ8Gp29wrMCAFcpQkUE6erJY67z61Klzn2YJE75WNqWgA/3GAP4jXQfkaqIid4PLhUz39ExKkJmh95nbljRKnJcu1PpnyDgzqKlZps2xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUj44CDh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUj44CDh"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so24906515e9.3
        for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 02:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627826; x=1785232626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+cGDwZcLwL8KiYreb24CUFPP8K2PTwnHJJuWk44wG5c=;
        b=JUj44CDhuKTiTTOJyxA8aHtxzT7D2WFNmg3NJbUoYfVWToRui8LJVoz0Nw6nMJ6fzN
         BsAsmquaf9zbq8S82IEC+1xqCALMRnkVdqzeJ32gwa3jFZicjUY2UEKpWWbwL6TU8JDF
         uLTnRjVTIf7YYP+QjRYjQf1prWwk7WpRrDmKTzSDxJA4yeROAfV9k4Vtu1q33tALDMXD
         l4mTYHu0VhF4pW4EjFJ9Wk4rVKO46Gd74vknnl0S2SpQyDvkIfX7OYK2dp2jb874t4Sr
         cSgP/Zl2YKLJpIS+UvZc00wABo5nf018NmcdAwvBnzehHjAlxkI/E/7s1rW3tCH7AyuC
         evew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627826; x=1785232626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cGDwZcLwL8KiYreb24CUFPP8K2PTwnHJJuWk44wG5c=;
        b=b6hABxjJNQNNNRtjgrta4Vp9c8OZAXZ9bChUAuc8/H2yk0751HQH9Mq4PTOoDrJ7Gz
         vE9JyKk4f6aqszhwDvlBK/UJu/QdnV+oMkwzxftvkznJZN949C7CfZLMu7aPYVt/KgUU
         GmQXKdi2X3I7EuFyAPxocNBdLuHQ1H/E+2Tc5ry+eKb67kDLzFS4gfcg00t/6pVf+EbE
         Qdj/IWrQQiKQVql0/ziMv2/lN4h9pv0IyjchPVr4j4+/XlvCmtGE4M3bCJeZxJjUU+YK
         tkTPX1O/ZCTF6HTwUXe/9ldPBOu63RDFeyHlyxUtLr7o9sMc+qH7FXuvu7KsxVXfi8h7
         XAeA==
X-Forwarded-Encrypted: i=1; AHgh+RoK4gHCJli5i3VAJ/LVSx/SoGMuXc0b3rhxVd7eXMsKE2VvzXZfzcsLSbReD370qVSvMdXzn5+BBXm6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0oUz+8FgsO+EkVpTib8OxnNGPmtCl0iG5m8zcH7dqO0QWcJcD
	G428OfegHnOjwcXqw33+Scg7BxfG5+tXN9T4YU5v4T+8vunnrjdmqV8s
X-Gm-Gg: AfdE7clnmE3MWC88Ro72Zh6sBdzW6SIZ3jk3p7ZPnauXbEIh9j/1Tgfy9c5sX1a3UNB
	29XbVSJ9sdb1052hcBloF5Buixq5DJEGiLEToF+pYOex9jYKFDCRw0tpF7cCCO9ub9XIMi+Lbcv
	9qn9GypfcMQO7x6SrcUITeATA3nlI8oRtdKdEUnReVX/AHtb5OK1otSjUNtkXqMsH9qVaFgL9UV
	2eK+jNG1D1JtA3OXhBEG2zE+PU8+JCSHShuTjqTFXtoSmmSBmfUlDrHJcISvaIL5WMGsDMnOy0q
	2LDAYdUpRke1gjalkY8/KLAvU5rkfY1ZJ7eWkOEpq8EthOtbQ9H5js2fuBKlH/BTFNrFX/pNUlk
	8MPJuYBkmXZWbae7qSRsfxk7DF+T6OIOGb8XkLjJcAgfJmvN0uRERS0GUSDFalKNeV4bOyWTVck
	6x3Ne6TCCBimJ3Q2qx2btIcck=
X-Received: by 2002:a05:600c:4fca:b0:495:4e1d:82df with SMTP id 5b1f17b1804b1-4954e1d843cmr165855415e9.10.1784627826040;
        Tue, 21 Jul 2026 02:57:06 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm227476185e9.0.2026.07.21.02.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:57:05 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v7 0/6] mfd: cpcap: convert documentation to schema and add Mot board support
Date: Tue, 21 Jul 2026 12:56:47 +0300
Message-ID: <20260721095654.429346-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initial goal was only to add support for the CPCAP used in the Mot
Tegra20 board; however, since the documentation was already partially
converted, I decided to complete the conversion to schema too.

The CPCAP regulator, leds, rtc, pwrbutton and core files were converted
from TXT to YAML while preserving the original structure. Mot board
compatibility was added to the regulator and core schema. Since these
were one-line patches, they were not separated into dedicated commits;
however, the commit message notes this for both cases.

Finally, the CPCAP MFD was slightly refactored to improve support for
multiple subcell compositions.

---
Changes in v2:
- fixed code style
- rtc conversion was picked, so patch dropped
- added audio ports description into mfd schema
- splitted schema conversion and compatible addition
- minor style improvements and typo fixes

Changes in v3:
- added regulator node names list into pattern
- filled spi_device_id with driver data
- ADC patches were picked, so changes dropped

Changes in v4:
- dropped regulator patches (applied)

Changes in v5:
- switched to MFD_CELL_* macros
- switched to use determinator of model
- switched to spi_get_device_match_data

Changes in v6:
- removed address-cells and size-cells from main node
- changed macros formatting and OF matches
- factored out common devices and made device addition staged
- dropped cpcap->variant check for 0
- EINVAL > ENODEV in variant checking switch

Changes in v7:
- adjusted spi_device_id entries (name/driver_data)
---

Svyatoslav Ryhel (6):
  dt-bindings: leds: leds-cpcap: convert to DT schema
  dt-bindings: input: cpcap-pwrbutton: convert to DT schema
  dt-bindings: mfd: motorola-cpcap: convert to DT schema
  dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
  mfd: motorola-cpcap: diverge configuration per-board
  mfd: motorola-cpcap: add support for Mot CPCAP composition

 .../bindings/input/cpcap-pwrbutton.txt        |  20 -
 .../input/motorola,cpcap-pwrbutton.yaml       |  32 ++
 .../devicetree/bindings/leds/leds-cpcap.txt   |  29 --
 .../bindings/leds/motorola,cpcap-leds.yaml    |  42 ++
 .../bindings/mfd/motorola,cpcap.yaml          | 408 ++++++++++++++++++
 .../bindings/mfd/motorola-cpcap.txt           |  78 ----
 drivers/mfd/motorola-cpcap.c                  | 143 +++---
 include/linux/mfd/motorola-cpcap.h            |   7 +
 8 files changed, 571 insertions(+), 188 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt

-- 
2.53.0

