Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D4737F01C
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164082; cv=none; b=HUyZCZDA7ASUh/jg4ANkR9YcAZvXUlqzISNMAl2iAYSfEMPrGwBtBRBf092S66Pzypus3xRuuUhbqt7iaZjRNg/CaSC7wMTU7jSdmnN15BLLcUGze6muPQ3d8uFts0iy2AkJqvSvQZbNqDAFZkFPY9/0Nu2y7vLVdULIZdtevJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164082; c=relaxed/simple;
	bh=xXyzJdB6YbkE/YtuRRtJ751/jp1klII4hawODy4l0h8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V0e8oQV9LRmlva72DbbX8BEaGG9LZsgNFClDUXb2oK3n/+XDpPXRSFQLoUY/H5oxYC7P+WkDDHs6k2rPUbfFpdccKFTYQVDEzNM10nBF6Bh2MTDIcG0LIh8gEG2fkcTyjKuhWveb8gY+iVbNVfZOgH2uiQjtA37d/PUfod2dbYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaXkVkLy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LltRhTwI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaXkVkLy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LltRhTwI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlq3U3787376
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 14:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yzqSchz4Oq5EuX/YsRclpV
	0d0k7mwwAwfJEMLNIbdkg=; b=JaXkVkLyEkv279PkIphyionoeFHvZ6mEXm/pyP
	W77RrM/ci/g5hKgV1uDoe6509gzJhULgICWNq+PsPP4zer++r63lxHLqYD3CNad2
	F8Dza3KbIL/n0PDL8WDwd7NjJwvYpUptdLb2HekFu9sE5P+HZ398uD1wVL4SBhkE
	rYTqZBKxhN0RiKJaQ1zRqEfm5Xbr6oeaGqcX749KgovHtcP8oizYctaLIJ8Di5Nn
	7yH1YTIds5ZzQUa8Jcy/VMH3eni0qJsCLNHv3XPpzVpq8b+0nXee4JN5iSWFV/Zn
	8wR+vgKJyLxLrA3QyIUb08mii1nvD66ZPWstJjsyVJyEqaFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2hg56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 14:54:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-529ae8e96e8so18944761cf.3
        for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 07:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785164078; x=1785768878; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yzqSchz4Oq5EuX/YsRclpV0d0k7mwwAwfJEMLNIbdkg=;
        b=LltRhTwISgYOf6QzGC+0YKOGkICkzzRcDoYzcXUeKzkWvowC2X122RSFDsP9Ur8hQx
         EfQLPFIr27QTn6HxYYuj/h0jMoc3StozKqWWiVQI7BvjDi1B48LnCc2ZfdSHP9RwR2MY
         iQ3ZcAz2XSS6oEl+lB/r2bOy9OT0w2p2A3BFZ+Y1+4Fyq8/dAmUSu9Pzb0E6HzZv8m/n
         HTBzqjtR+EqZ5xDHS/7d72OymI0clojKGbkEJpKt5QEE+Une/ioYkTJOPlmjhmCmxmFq
         6Tlw5Rvs7/+YmQHi/XjsS7dTuEn1vrWofsGmMO7A6p9CNYeyfwLL0JTBSzZBPm1axPBD
         TacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164078; x=1785768878;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yzqSchz4Oq5EuX/YsRclpV0d0k7mwwAwfJEMLNIbdkg=;
        b=E7SYl4tqzi9FNmcdQoFUZfHQz2baPPcBrfgRGrh6VEwDRepWZPqbkXs6fuJKigpO4p
         cnwajx76KVhAS4njgz2yCyY5X30lA9ckQ3ssojIQhn6FtqtE6m/98G2DI5LmU29fgtMk
         zVK+msBExryJIy6uPhJ+DsvCz6tzbT4ofOjPD6U0OjnfuWEooDFN0iZ1x5dlTD04t7wf
         8rPA3IiDOp1m2bFf6dtNtW1+8mBMeCMC3J9BMmuDJKdbG/h+QcvT7SAPSDcAk3RwsPhx
         9cE92liVleLxT/PN05vOiuGTrudziJpmKRBA+FDloQGnuAx1TIqivItAXcrl51Qu8K8S
         l3aA==
X-Gm-Message-State: AOJu0Yz9F/YbFSgsU3NYIrf6Nw0nJZhDBgDucYWTQyGMowiIjo9a+M+r
	to4g2zRD7uvVSjWGJ+CfVEA5S1/Ef0R+3WrwQn0SFEYnYd0LQ02+Xg+2GPnlTpHvF+59ZxRgkMC
	opzln0JTdvQhxDa1+2uiUeMNO12U5gpmrohMt4n/LZxF2wr5QXhV1Y/oq4XR1ihWL
X-Gm-Gg: AR+sD12DeObWy3Tn6maFfl5LywcZgGghjWzWo6Y1oCe0KlmFcZyDfPresCIR0DdId3D
	4GBUmnEBxhGukuNXdBxciP45/7ytImbOfyHTXXdIYJexZaYx6LBsq5PnONTahZ4adYv+RfcD96j
	6KbIbQIUqoy3x/ovVN4ik1TVwJs7mkXVSd73cbnvsy9C4Y90u9e3rJtwL8ruyjvySi21rFaLCiX
	y1UNXYOZqKtgetFIv4NlavAS+dlVoWLR7Fqy1T9xL1rfDecr9FR6Z45kZInjh3izdjzULI8JDiK
	1jdJhKiu8zJnRxDA02bayKipQC14pOavSldaIXTUsklRYopsaJcPCgjEbkY2MyneC9ND62UtDEY
	fgMhoJBqMNnJlzYVOw4wV6GveyACj5gzDB7FJgfvJz0ZcG11f045vGNPTFr+7W8c5C8UppSXR9x
	O68Mb+LDZZJUUddG4RsE2iek/Lm/w6WCSbwH5gT42FRDrk84MWmeDt
X-Received: by 2002:ac8:7e85:0:b0:51c:f3:34e3 with SMTP id d75a77b69052e-529a84c3aefmr88731701cf.28.1785164077455;
        Mon, 27 Jul 2026 07:54:37 -0700 (PDT)
X-Received: by 2002:ac8:7e85:0:b0:51c:f3:34e3 with SMTP id d75a77b69052e-529a84c3aefmr88731251cf.28.1785164076769;
        Mon, 27 Jul 2026 07:54:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm3027582a12.26.2026.07.27.07.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:54:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v8 0/4] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Mon, 27 Jul 2026 16:54:32 +0200
Message-Id: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAChxZ2oC/3XRzW7DIAwH8FepOI8KDOFjp71HtQMYWJGapAtrt
 K3Ku4/0siA1F0t/S/7Jlu+kxCnHQl4PdzLFOZc8DjWYlwPBsxs+Is2hZgIMFFNgaT8Ov45eYig
 UwUJUBq2TltSB6xRT/n5gp/eaz7l8jdPPw5752n3KzJwyyjBpZE4H5PJtLOX4eXMXHPv+WAtZt
 Rn+Bc14I0AVkPvIvNR1KbUjiK2gGkFUQejo6jXGCCV2BLkVTCPIKjjtMGEHEpnfEbqNwFkjdKt
 grIYABsGkHUFtha4RVBUC1yC91ymKsCPojQCyEfT6Cw6dEz5FZ80TYVmWP/W+S7A3AgAA
X-Change-ID: 20260629-monza-leds-c292e68c9a49
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX0vTp7Paoz3ZU
 CoKxHLWvzTsKYrexSJ2OI7wjg1sWdaQP3IrH6jmMIx/CDEV48KtC9duCE04iPkTiBGlnPWKRqwP
 Z/xsvvlefNt0b6xtaSOMWLAgZTq2ztQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX7Fm1AKBnWYn7
 yXTpJiAN2pQBknB0XmKnIXMJ4UNa/nDdG6CrpYcfQaA7An6yK9EbCFcJ1FZAnjiOC32Aza20sVf
 7CttSMngHD7EhCe54gExXZvUKaBZzTsxFOe2jQtTKDUHSJxFJj4SiCVEfE9QGZwdGxW4D2Zcoi9
 tXsZA4rV6hqU1HN1vjwTBaWmJ5MiVzg2Ppe/Wgxqus8TrH5sV4Yz7ETfd+qY3crQNjd6Us2Og1r
 doZQswQxA76iaRH2gDTwXL/CmpNvQWcn2piyfSGpodcm4+HOwRrfE6pVIHvHmR4zPyTFTkER8l+
 oXzPW3IhfkPjpIrKb5IfHnEKd4M+SDZPp0GM5C5jNg96CZ0VC1Kh6PtI8Igr41QaABizGjDkMiF
 9UjIZiCB1LiLB8K1ftPCilW/QORCDapOvDr4i+x4UtYXsK0JaBUKvWAZQdTwjuetAibFk3YsP+X
 XX+zG8w1NJYjpAm5GMQ==
X-Proofpoint-GUID: rZF7odr8Zyh4aUl807HB5D3f-uAdtsUh
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a67712e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TplmsQoH72OTL2-p6AMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: rZF7odr8Zyh4aUl807HB5D3f-uAdtsUh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270140

Some devices use PCA963x controllers to drive RGB LEDs, where
multiple PWM channels correspond to a single logical LED. Add
support for grouping such channels into a multicolor LED device,
using the LED multicolor class framework.

The DT bindings are extended to describe these groupings via a
multi-led@N node with sub-nodes representing individual color
channels. This follows conventions used by other multicolor LED
drivers, while maintaining full backward compatibility with
existing single-color LED definitions.

The PCA963x driver is updated accordingly to detect these grouped
definitions and register multicolor LEDs.

Finally, the Monaco Arduino Monza device tree is updated to expose
the onboard MCU-controlled LEDs (compatible with PCA9635). The MCU
manages four RGB LEDs mapped to channels 0–11, which are described
using the new multicolor bindings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v8:
- bindings: fix indentation in the multicolor example (Krzysztof)
- Link to v7: https://lore.kernel.org/r/20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com

Changes in v7:
- Pass the channel/led_num explicitly to pca963x_brightness() (Lee)
- Drop the per-iteration led->led_num assignment in pca963x_led_mc_set()
- if (ret) rather than if (ret < 0) (Lee)
- Propagate the real error code from the reg property read (Lee)
- Comment explaining why the global power state sync (Lee)
- Comment describing the is_mc detection heuristic (lee)
- Reword the init_data.devicename comment (lee)
- Link to v6: https://lore.kernel.org/r/20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com

Changes in v6:
- pca963x: keep chip sleep/wake state consistent with tracked per-channel
  state on I2C failure mid-loop in pca963x_led_mc_set() (sashiko).
- dts: drop deprecated 'label' from the multi-led@ nodes and use
  function = LED_FUNCTION_INDICATOR with function-enumerator <1..4> for
  predictable per-LED naming (sashiko).
- Link to v5: https://lore.kernel.org/r/20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com

Changes in v5:
- pca963x: fix multicolor power-state tracking (leds_on now updated per
  sub-channel, avoiding wrong sleep/wake state).
- pca963x: dedup the single/multicolor registration paths into a common
  pca963x_register_led(), with mc parsing split into
  pca963x_parse_mc_subleds() (Lee).
- pca963x: use dev_err_probe() on the probe error paths (Lee).
- pca963x: pca963x_led_mc_set() cleanups: drop the extra loop variable,
  use 'for (int i ...)', etc. (Lee).
- Link to v4: https://lore.kernel.org/r/20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com

Changes in v4:
- Narrow the led node-name regex to allow only hardware-supported addresses.
- Remove useless 'minimum: 0' prop, and add 'maximum: 15' in the default block.
- Link to v3: https://lore.kernel.org/r/20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com

Changes in v3:
- Add color to required multi-color leds (sashiko/Conor)
- Bounded registers value for nested led subnodes (sashiko/Conor)
- Add fix for PCA6535 reg limit (extend it to spec)
- Link to v2: https://lore.kernel.org/r/20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com

Changes in v2:
- bindings: Reworded commit message to explain the motivation (Krzysztof)
- bindings: Kept the "^led@..." pattern and modeled multicolor groups
  via a dedicated "^multi-led@..." subtree.
- dts: Renamed node from "leds-controller@22" to "led-controller@22"
  and dropped the unused label. (Konrad).
- dts: Moved "reg" to directly follow "compatible" (Konrad).
- dts: Fixed unit addresses to lowercase hex (sashiko).
- Fixed checkpatch issues
- Link to v1: https://lore.kernel.org/r/20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com

---
Loic Poulain (4):
      dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635
      dt-bindings: leds: nxp,pca963x: add multicolor LED support
      leds: pca963x: add multicolor LED class support
      arm64: dts: monaco-arduino-monza: microcontroller LEDs

 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 108 +++++++++++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 189 ++++++++++++++++-----
 4 files changed, 361 insertions(+), 47 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

