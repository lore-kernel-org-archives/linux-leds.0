Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6EC189F43;
	Fri, 11 Sep 2026 00:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084935; cv=none; b=JSu5gum+db1RK8u3v72zrdRA+WjqfWDoi9tVlpTVEG1KtTfy/W7D6mQHYeYFtNZ1QvAjfXMxZIjzwEMWrT09Q/F2VrpfAwf+hTTZqatpXPWPFrXyW594FYWWRyIcHdsKj1ISc2XmpmWflXNvkBVMjTPJcb9gMqFNcS4zt6lrKoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084935; c=relaxed/simple;
	bh=HA8jb4fiiT0zE2f7/txkstoo4RIkzqscdASaVnn4zWg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=AHZOgMwAlXzzf81KfjGfoUyomeHMN1ZLreqD+cB326JugSRhY2K5RCWlU2XleDhtmeWW8DtHp6mFYDDA+yGJ7l+fY+UJEExNFw6dHRRMvpb4tOD2TgvR0XgkomRCfLb2XF4Rs9xQoZ4429nOF6/yW5AMJlRWRD+BaRnaeWf6Cy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=AHyUFeBM; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="AHyUFeBM"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALXehp382180;
	Thu, 10 Sep 2026 20:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=8cYCYSk7GQOFeyNizHCLjjed1QK
	zj9CrZbVzF787p8E=; b=AHyUFeBM1PxQrx6wnl8/y1Q1WJnKQmUekPYyM/vL4uD
	zYZPETl2qzZVsek7Ephy23CaFz0dIDn1mvp+/Ia2NpI8AOWSZ8AkR69O7aXql3r1
	A41ocvDL/TOGpcazTwIUaW1nnWBjCn/MuxpADISY5lkIKAPRiCvNrMWZbhnBDqTz
	oMuw9PhuRxnsxICmZMIBNHoXm4USgpIzpRul1AZfYRuVoVL1/A7ECfEgZKRV2LjG
	derjnCPnWZ6L441pntws7KiGHsikDVZntlLaXexeJXAqX4fOP1NOvyG5Bxnhuk5E
	lyuGDnPjwFK1qnNx3Wq6/0hzO1q2xEbNCqyxIwlCZog==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcxaeem5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 20:02:07 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 68B026om024875
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Sep 2026 20:02:06 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 10 Sep 2026 20:02:06 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 10 Sep 2026 20:02:06 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 10 Sep 2026 20:02:06 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.26])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 68B01rBs031719;
	Thu, 10 Sep 2026 20:01:56 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Subject: [PATCH v13 0/2] Add support for LTC3208 multi-display driver
Date: Fri, 11 Sep 2026 08:01:50 +0800
Message-ID: <20260911-upstream-ltc3208-v13-0-fc9aa3758b55@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5Eo2oC/33SzW7DIAwH8Fepcl4mmw+Dd9p7TDskYNpIbVMlX
 bSp6ruP9NJMoIkTCH4Y8781s0yDzM3b7tZMsgzzMJ7zBPXLrgmH7ryXdoh5oVGgCDT69usyXyf
 pTu3xGrQC37oQPJPvE7E0+dhlkjR8P8yPzzw/DPN1nH4eVyy4rv6DLdhCC2gTJhQGsu/duTuO+
 9cwnppVW9RGUFQRVBZ07AOz6gnYF4J+CgZqgs6CS9BjVCDiukIwGwFrgllr8N5I1GI4la+wT4G
 QK4Jd++BsRA+0jkKgjaB0RaAspEB9ZGcYqRTcU3BQ+wuXhU6iS66PhjAUgt8IGiqCz0KuIARth
 Wx0hcBPwVf/grMQnCHxTgVkXQgIGwJdLVK5k61gYkumR/FlJ3ATS4ZaM3HNpfLJJkhRk5HS2AS
 T8/aKsSaTEdyqdK6HP8b9fv8FAv4O+I4DAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789084913; l=6042;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=HA8jb4fiiT0zE2f7/txkstoo4RIkzqscdASaVnn4zWg=;
 b=GFHUU46CEBzQeJcNkqQ3sl29c0GB1CBfoBKFb3qiary9Go4ZFRphGg59PQCwk+pe2pakK9+7s
 nIElTJMYZ1tAvcFOsXfr9eVfgU/N+SGyJykYu7CCJC0CGxk/oEtwEnU
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDMwMyBTYWx0ZWRfXwrL4sLnN6H28
 wAUvOSyUhMSxTBdS6fjbJNdjnH+ZHa7nWh2lIEEZoWWEMtcym1DdSbFaHXyPAKTbTomNWPovqp2
 XYDjBJ8D7H3lNwQkq6qtpjKW0E/Tdt0hXTwAigQtrGRmXvDC4CGN
X-Authority-Analysis: v=2.4 cv=Ao17T+9P c=1 sm=1 tr=0 ts=6aa344ff cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=UB8o897QqzuJ1Jlf0MEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: QL2np47WKjR3rzYxTHs1aLAFhIb6IAxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDMwMyBTYWx0ZWRfX30WAT1jMKRCN
 ixweEAP9Jj+h6UaBUGHKi5m9HLeIaOW9fiwmOqcx/6AvbtzAqSCuuWfum9KxcPwUeHpMQtpQKgI
 38bVmNzNWq+aN/7H9LHGQ3hpe1n/NadCcqlzamDwDaZ8Yc2duyTmPXH8vlAUYc9Pf0XjEeFr4Ml
 +6hkG9egCGaCNs9ISiyWD4mIDV9PwZiPZxJ7pSRTXvYjxpAJzd+1JZFVk4MeDZWcnEeGo7m2VGC
 Hxrvm4YHyTlcQLBz98aLCl/BWeSyExu/sXJcayTe3vxDw99pwyQAzFtU1BFJfGkj+ByFg3sL1Xh
 LyG8d1GFTTGf1MN14qXHGFOG6PWKC5Nm16clm7t8T1L5h6uJcBfwlZdoRrKHD8HT9EufOQNkqXe
 90off5knczLiChAiRt+rRRZZkzDgYut/RhialEX65NJ558E0wHi9mM23rYCsjUPN10mumu4Camw
 cMv1Q/jJ4RsTHX5FIQw==
X-Proofpoint-ORIG-GUID: QL2np47WKjR3rzYxTHs1aLAFhIb6IAxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100303

The LTC3208 is a multi-display LED driver, using a high-efficiency, low
noise charge pump to provide power to 5 channels (MAIN, SUB, RGB, CAM,
AUX). Current for each LED is controlled by the I2C serial interface.
Four AUX current sources can be independently assigned via the I2C port
to the CAM, SUB, MAIN, or AUX DAC controlled displays

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
Changes in v13:
- Mistakenly replaced max_register with LTC3208_NUM_REGS. Reverted to LTC3208_REG_G_OPT
- Link to v12: https://lore.kernel.org/r/20260911-upstream-ltc3208-v12-0-9107f5f0a7b0@analog.com

Changes in v12:
- Added LTC3208_NUM_REGS to explicitly define the register count in
  regmap_cfg
- Link to v11: https://lore.kernel.org/r/20260903-upstream-ltc3208-v11-0-28f5f0fd364e@analog.com

Changes in v11:
- Fixed inline comment formatting
- Adjusted newline spacing of device_property_read_bool attributes
- Link to v10: https://lore.kernel.org/r/20260817-upstream-ltc3208-v10-0-e1f9564b1e86@analog.com

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
 drivers/leds/leds-ltc3208.c                        | 234 +++++++++++++++++++++
 5 files changed, 438 insertions(+)
---
base-commit: d43f1d792902ba0a53fd311bff2cf96095c7606d
change-id: 20260318-upstream-ltc3208-7cc8968bf69e

Best regards,
-- 
Jan Carlo Roleda <jancarlo.roleda@analog.com>

