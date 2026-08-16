Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616D338DC6B;
	Sun, 16 Aug 2026 23:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786924024; cv=none; b=iNorMnJkOE2D7UsnPXjV3vEr6OcecrIxyx+O06aFG+gIy3BB4zriR+M5zaA8ekNKq9RUHMWmErfOsMrWQPQ8BH0Jp3yP7hm1p9INHNFni9i7IectZsuAqNLMqJXSgnSwHgmewuv0Am6vm6s/RxvsmSRHWDE/V6DR9XaDlzOn+ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786924024; c=relaxed/simple;
	bh=SeND1vOfZlw6sov+cJE4VQdjzlQY0VBfKYxfHKklnSQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=B6i6FizOF9Qs9ktHnRTaPGBB+1/EweQr/ZR5U7bKycQVpy8AzVoykvkeGI5Cu0/x4Gw/B9QdsFCN74P1+mLI2HL/4EbEDFa4OoDCxt4tyD46+UFo5Gc1iTWYd3M8UULTVptsPxaO3G0gqu0fir0caZegBu1P+2sCs6GJnAKFm8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=pebNMSvv; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="pebNMSvv"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCEL62526728;
	Sun, 16 Aug 2026 19:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=+PK+bbBkZDwx2qpORE7D9HWv6jW
	Zq5g18p0sgSQ+QRA=; b=pebNMSvvNfMz0UG6yH1pMx3A6/J1OweCI+jp6Qmpq0l
	aCihQBd2a0Twzp4CMtiFbtlFIAUAK0wJAKlaw+EO/wT/6xz+/h7z/bRWqU3lfKhI
	R+2mr0VhbUV47rBs2LtFbPPovdhJrgXdODzyKS2mrXaTlFhPUGZeol59wrGshD3a
	Un3iJGuMDZyWJN6Q+WXPcHkhSeb++jHI73gyNB8YaRQygllJooN4QOrUMREEuFZx
	PIaZ/k+DkQI1uIdWLUHPo+ukqIuRCQcuDDqE/U/xS+LM36oQhgBRbr+/VT0cnWzW
	meMrlfE5p8RlG6MkKT+KfLHN6f6bybQehG4eL+yooGg==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4g2n0xd96w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 19:46:47 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 67GNkkqu018458
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 16 Aug 2026 19:46:46 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Sun, 16 Aug
 2026 19:46:46 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 16 Aug 2026 19:46:46 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.22])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 67GNkXwu005076;
	Sun, 16 Aug 2026 19:46:36 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Subject: [PATCH v10 0/2] Add support for LTC3208 multi-display driver
Date: Mon, 17 Aug 2026 07:46:29 +0800
Message-ID: <20260817-upstream-ltc3208-v10-0-e1f9564b1e86@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVLgmoC/33RzWrDMAwA4FcpPi9D8o9s77T3GDskttwG2qYkW
 dgoffc5vSTDZvgkgT7r5y4mHnuexNvhLkZe+qkfrjlAeDmIcGqvR276mBNCgiRQ6Jqv2zSP3F6
 a8xyUBNfYEJwn1yXyLHLZbeTUfz/Nj88cn/ppHsaf5xcLrtl/sAUbaABNwoTsgcx7e23Pw/E1D
 BexaovcCZIqgsyCil3wXnYE3hWC2gQNNUFlwSboMEpgtm0h6J2ANUGvPTinOSrWPpVTmE0g9BX
 BrHuwJqIDWl8h0E6QqiJQFlKgLnqrPVIp2E2wULuFzULL0SbbRU0YCsHtBAUVwWUhdxCCMkwm2
 kLwm+Cqt/BZCFYTOysDevVHeDwev/bpDJXCAgAA
X-Change-ID: 20260318-upstream-ltc3208-7cc8968bf69e
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jan Carlo Roleda
	<jancarlo.roleda@analog.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786923994; l=5416;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=SeND1vOfZlw6sov+cJE4VQdjzlQY0VBfKYxfHKklnSQ=;
 b=JqBbJ/LKgoNbELpGTmjP+H3y+Fz2Xy7/27PQh7AIoBn/7+TuNx47XPcjR0Mflch0MiGLgaFzv
 h0Hb1Sb781mAfsousIkfWP5mLezYt5fW0MMVBIqGcxZzK59h+mnlmdL
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 3WmHNnM0AdlYeoIX2WgCmin6tN8NEc0a
X-Authority-Analysis: v=2.4 cv=BaToFLt2 c=1 sm=1 tr=0 ts=6a824be7 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=UB8o897QqzuJ1Jlf0MEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 3WmHNnM0AdlYeoIX2WgCmin6tN8NEc0a
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE5MyBTYWx0ZWRfX0Cr9z57QuI3g
 F7i8Yua+NlJp0Kf0fWNDAaVExBFOrDzlxdSj9LZ4r2Xpt79jul4F1zeWMy/0n5w+hoEaDudcHHz
 YGkP9wyVQfN8R+SOsA21JlwPVIzWQ+Xn6dlSPWJqSFixnxVf+R3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE5MyBTYWx0ZWRfX7tp1mMsbi47G
 eH2Z3YPzmZt/fXP3a/NKMnbeCqrrenaRkn4i39qZD1GvQaSzm7GbNw2T0SOeRXEgqaSyvNpgd7F
 ClHuAgnKY52Bxf4d+2LqMpovxvdNdJzg6lb1G/GHYeYec+Oa3e43h7Jb4t2Sv2fhd1WiI7Ofcow
 UVaQAXeITdbAldH7rywx+bkxD1Fcd/mXXtQ+lQwkaIKNZ56hpT42WJapAbiyyj63OqByoH+jS+n
 VCrkVEIifDx70lUTc8/choe+/pPfuI5HEBRbKe2lIZETmLinDO3VAAphjOVzOiV5KpwnuiYS9Sb
 qCWmlYSQG703wEMhmbKPF5nLN6EWreNyPMZoxx8viMrRHrt1qdvEZYDNDf6RCu8QHpwVa6eM61R
 +JgPDnzlCVaHmMbiG1rSCbtAayZF1O+I6qD7dliSqMO2mEBsyjEKN1Mvz6itj4l80JKnNWx8n22
 A8F+iQflW5yaIzaIAlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608160193

The LTC3208 is a multi-display LED driver, using a high-efficiency, low
noise charge pump to provide power to 5 channels (MAIN, SUB, RGB, CAM,
AUX). Current for each LED is controlled by the I2C serial interface.
Four AUX current sources can be independently assigned via the I2C port
to the CAM, SUB, MAIN, or AUX DAC controlled displays

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
Changes in v10:
- Appended "_CURRENT" to DAC register names
- Removed additional newlines
- Removed size specification for ltc3208_reg_defaults
- Standardized dev_err_probe messages to start with upper-case and
  removed full-stops
- Updated dev_err_probe messages to be slightly more descriptive
- Link to v9: https://lore.kernel.org/r/20260806-upstream-ltc3208-v9-0-c746e872c193@analog.com

Changes in v9:
- Add "#address-cells" and "#size_cells" requirement to devicetree bindings
- Add regmap hardware synchronization to reset value (0) in device probe
- Link to v8: https://lore.kernel.org/r/20260730-upstream-ltc3208-v8-0-6bdcc35e65d7@analog.com

Changes in v8:
- Adjusted register define comments and formatting
- Adjusted aux channel string declaration formatting.
- Removed I2C client from ltc3208_led.
- Replaced struct ltc3208 with a bitmap to validate unique channel
  registration in probe.
- Replaced ltc3208 kzalloc with individual ltc3208_led kzalloc in probe.
- Added spacing to each bracketed item.
- Adjusted formatting of reg_field declaration.
- Replaced reg_val with dev_options name in probe.
- Adjusted error messages to be more descriptive.
- Removed newlines from error messages.
- Refactored AUX channel configuration to be more readable.
- Removed id_table from i2c_driver initialization.
- Link to v7: https://lore.kernel.org/r/20260708-upstream-ltc3208-v7-0-aed7f7bd461c@analog.com

Changes in v7:
- added reg_defaults to regmap_config
- removed i2c_client and regmap from ltc3208 struct data
- fixed typo comment in driver commit description
- fixed string formatting of u32 chan data in probe
- added explicit CPO set to 0 in probe
- Link to v6: https://lore.kernel.org/r/20260623-upstream-ltc3208-v6-0-fc6bd9749166@analog.com

Changes in v6:
- Fixed code conventions (spaces in brackets, awkward line breaks)
- Removed unused `i2c_set_clientdata` from probe function
- Added guard for potential errors in AUX channel configurations
- Added guards to prevent duplicate LED registrations to the same ID
- Corrected `dev_err_probe` return values
- Link to v5: https://lore.kernel.org/r/20260619-upstream-ltc3208-v5-0-075d18060606@analog.com

Changes in v5:
- Fixed MAINTAINERS commit ordering
- removed i2c_client from ltc3208_dev
- renamed ltc3208_dev struct to ltc3208
- refactored brightness_set function to use regmap_field
- updated leds attribute to use constant size array
- updated regmap_config to use REGCACHE_FLAT_S cache type
- added max_register to regmap_config
- renamed variables in probe function
- renamed map to regmap for regmap instances
- moved AUX channel configuration inline to probe
- Link to v4: https://lore.kernel.org/r/20260416-upstream-ltc3208-v4-0-3884ed3e49f5@analog.com

Changes in v4:
- Reordered commit order to match dependency order
- Updated Kconfig to be more descriptive of device
- Added led@0-7 with more complete example properties (function and
  color)
- Driver changes:
-- Removed unnecessary include headers
-- Formatted macros
-- Created helper `write_current_level` functions for LED current
  configuration, using `regmap_update_bits()`
-- Adjusted awkward tabbing issues
-- Updated variable names in probe to be more descriptive
-- Updated inline comment capitalization
-- Initialized `i` within the for loop in AUX configuration in probe
-- Refactored `update_aux_dac` function to use array pointer
-- Fixed error messages in probe 
- Link to v3: https://lore.kernel.org/r/20260406-upstream-ltc3208-v3-0-7f0b1d20ee7a@analog.com

Changes in v3:
- Edited device bindings descriptions
-- removed full stop in title
-- replaced quotes with double quotes for consistency
-- removed <dt-bindings/gpio/gpio.h> from example
-- removed led1-7 in example for brevity
- squashed maintainers commit to driver commit
- Link to v2: https://lore.kernel.org/r/20260326-upstream-ltc3208-v2-0-3dbc992b6098@analog.com

Changes in v2:
- Addressed DTSchema bot warnings and errors
-- removed extra blank lines
-- fixed $id to match current naming
- Addressed Kernel test warnings
-- fixed bounds for aux channel configurations
- Link to v0: https://lore.kernel.org/r/20260318-upstream-ltc3208-v1-0-015f1f1e9065@analog.com

---
Jan Carlo Roleda (2):
      dt-bindings: leds: Document LTC3208 Multidisplay LED Driver
      leds: ltc3208: Add driver for LTC3208 Multidisplay LED Driver

 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 183 ++++++++++++++++
 MAINTAINERS                                        |   8 +
 drivers/leds/Kconfig                               |  12 ++
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ltc3208.c                        | 231 +++++++++++++++++++++
 5 files changed, 435 insertions(+)
---
base-commit: d43f1d792902ba0a53fd311bff2cf96095c7606d
change-id: 20260318-upstream-ltc3208-7cc8968bf69e

Best regards,
-- 
Jan Carlo Roleda <jancarlo.roleda@analog.com>

