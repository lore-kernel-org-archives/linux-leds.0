Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242DB3AFB13
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879302; cv=none; b=M+50LXCpVvc1kqWAv0MaSAbR7fF2zYvc8rdJXOInfVnit62zRxVjcnzQTrH7PXzkaooWstVGqnFDISTTME1HPySAl4sk+y2d975EWsxcIRU3HR6JPC5BIjt/qFTntxlp9dwoFy0NgGokAH73OxndBBYH8rwZ4NvHtW0ZjAhCMwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879302; c=relaxed/simple;
	bh=Y+AnL5HAjoCUhYXw0bVjhldz1Ov4kcZKQpwAjjEnS58=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sqz1/DsPj3C00i2dezbJatrAldXWR2m9PiwngxsM+avbQwst8MxgHOtiS93+hZCjlPUCmN+9NpkSX1VH411G9iYJ4Lxv5YXxb3M6NR6a9kzNg48GkIbFU4+TaFtiB3i00iGdw6uI7BeRBmNzn7naX0D56SGGFK6m8rVJhulr6VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOr9F6W4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWxD3iHJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOr9F6W4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWxD3iHJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lO1m1992302
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vrujEKY5XD05AJiWSLZWVD
	sZmXBD6ByqDotlXvjH5TQ=; b=hOr9F6W4zzAd/7DzBmTzG9iNV5zDF7y/0rJ2d6
	GbEQVHLBY6n4Z8g6veVg3Tz/N/8i7fUbj9EMJDXUaxDZXU7s5h04WaD3w8OQhX+n
	mOKQ/h/dyFDzuNPBFPvh0Hgy/ijPMU1L7rSzx/+qVCr/EcjPjKFsb4kovC3GU+7e
	kQZ50XDib+UwcRRFxLwopaCFw7wdKSqrb32oQhA8Ys4UxL96v4PQyOZyG05OAx72
	YUuCCo4WgA1N/Eks88nww0oU6u+rhNR9zisgBP10qJ/45JXg4FAEyETsRQQNuUVj
	i2/vX8tLGexYdnyWnmf+B8J9p+n11VwDhpAGhrsd4IbDhFZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p50qm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so1474141cf.0
        for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 00:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879299; x=1785484099; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vrujEKY5XD05AJiWSLZWVDsZmXBD6ByqDotlXvjH5TQ=;
        b=EWxD3iHJF2Dd5bsnj6MQEClS1980+G0+xvCkuvLorAu8lJ82wlEnd7tYMUHXUtGH+J
         KhcjBS5itusEoF4CmOHI9F7AQVFcngmKJXJqjpepyzAtpyVo3jT7Kq1+62lrEoyf9Jxa
         FP+8INIC/27qGf+p4lUNGvSPmS+tccAZSUdOirwiOzTIC/V4xGVbHVyctPsMBSVUUB0r
         Yb1Vq8xtbqlGbaAxKk69wBCU8DGNqs3DcIRSUUFFyzCB9OeytfnTL+K6EVEobp/CxUdf
         CcdE8aPKQGc0L8b0KfB3DN6499h0KUyDCPlBE/ew2EyZ85T1wbl+/UVPi6UFQQyUEIg8
         Q57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879299; x=1785484099;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vrujEKY5XD05AJiWSLZWVDsZmXBD6ByqDotlXvjH5TQ=;
        b=X0317oEaGTa3otZpvxtSYlRA5HDPeldRGSa9UKFmw25jsNt802PLc3MgbBfssmGmgu
         VTKMrkBURmqVwe63w8y0QNZG6qQBpCl93rRaQnjvPwjs9pfe1Ufz1eSGy/yJdXyievek
         n5Ts2bYfduQVVGgYQmSDeDL3+pV21kaTeIqmaUfZXZMUlvGjFxKYGHm8nRgWK+/oqvO8
         AglyXYcUQfv08CLQs+lVG5q5OSPh2rXPUsmwVH5Spm9XuGpf5YH5Gx+m+glc2Dh4MNdP
         xBdQ6QbLpgK5sXvZxMkBlu8ZxjUY+j9NM+8sd4Y9wfyRQu5rhgJfEK9uQXfzFmBU8M1u
         FVJw==
X-Gm-Message-State: AOJu0Yw9tLkFfXHAUWVKZxDR1iwLPmASas3Dx1MV87P7UzRXQPqEHpTc
	IeNExLtKc+n8TCOlldhpaiPJ4T7HujbkKuldbKNwXo+FiizrjHavwDt61dU+LBm3vNMvC1MS5mk
	Zb3hMy2F3YBWLKKWkT5lRGhVPTQQnABpXBFxrQMBK58uhFjMxsKRQwsH03faga2Rh
X-Gm-Gg: AR+sD11ja3lsPDEdUV3StQpi5z5hXaXmJyziUfy3Q7FuCt7sLZvNBGomvTHiGmtrx6t
	Vqg8fKhSCaeF57dmqwIu+2p9sxb2TK86rlwP8jxBMlEC4FJs19oDxTcSEucueC3LOvB1PlLyOD2
	3mvDv294MNibJH1CpIR3fZsaUvA1u/8r+jKTFxewqMgt6Q1HiiXi7VFiv4f8Vz5PNn4dtR9aySX
	UP5qyHnRIb1r2jBZJnXJLJcm+nT6xYKeNnlcBPwGGWx/vanCWIxd92oBwdqtu5siJmh1WdNBOie
	jxHXn0drxNlI5t36uBUOR1EZZypdANw+Y7XkQ2rokIeRVCoWtQl8Cnw+r4ogXxCpH7yYAWOoxZq
	SOGm5TYXRFMogEIN2Y2JBxTjxTCaqnowo+eokPo5JIuDjwkecKcx1FW0osblRet8YsYETyEQOXo
	1FDCbXkPCaPqpY7TzQgcXLipP5b5h468JCMgbw2aGM4MOp+b+f9Q==
X-Received: by 2002:a05:622a:2509:b0:528:583:a6c6 with SMTP id d75a77b69052e-5283dd95c30mr60171441cf.6.1784879298697;
        Fri, 24 Jul 2026 00:48:18 -0700 (PDT)
X-Received: by 2002:a05:622a:2509:b0:528:583:a6c6 with SMTP id d75a77b69052e-5283dd95c30mr60171211cf.6.1784879298180;
        Fri, 24 Jul 2026 00:48:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a798a5sm320764566b.9.2026.07.24.00.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:48:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v7 0/4] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Fri, 24 Jul 2026 09:48:14 +0200
Message-Id: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL4YY2oC/3XPwW7DIAwG4FepOI8KDAGy096j2gEMWZGapAtrt
 K3Ku8/pZUFqLpZ+S/8n+85KmnIq7PVwZ1Oac8njQMG+HBie/fCReI6UGQgwwkDL+3H49fySYuE
 ILSTjsPW6ZVS4TqnL3w/s9E75nMvXOP087Fmu26fMLLngAjuLwtuIUr+NpRw/b/6CY98fabBVm
 +FfsEJWApCAMiQRtKWjzI6gtoKpBEWCssnTN84po3YEvRVcJWgSvPXYYQMaRdgRmo0gRSU0q+B
 aCxEcgut2BLMVmkowJERpQYdgu6TiE2FZlj8lzrc79QEAAA==
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
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a6318c3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TplmsQoH72OTL2-p6AMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: rRyQ0WF2BZopEx3P6PmHF_fFQ50o_JcX
X-Proofpoint-ORIG-GUID: rRyQ0WF2BZopEx3P6PmHF_fFQ50o_JcX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX3MQPzl+fqIw1
 NOvvus1xb22tCd1mlITBnGvH8pX6NNs5MltW+KQAo1Ul3a7SE5P0VeeBF/xWZDXbjDah8iNYvZV
 714Px/gIMv5HVkydwxqlEg8sW4nifnE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfXy12+L+VGybLy
 AkvruZkAd942ACJE5sTMsL/54ybEdjZKYBnPZJcskMWn/MUKFTupAC0jmgHX7UKJGBLQKEu+EBh
 dVPm4VKbu2XHCwC4905CWbMW9rBsKifuylq4KYCWPpwPDFUXLTC8AJm/xakv0BUF/TbtarptCLn
 AWtTcSmvQDKuYh/MNXokCLt07Z2JnaQGuIdLdpSHZejaL7KlLsYPL3mwcacTYSysUzuV6HYsNI7
 kSccEoPoADXE44zb3d+tOt5TSOxAwEEnRoFDoe6FaZyEv+U2OcFeBl8VcPDa8VlHkHUHVgFuY96
 0cVxi50yGa8NuTVjXbQtzDJQPtcB3SEQUMOQj6IUc7tkP9a/mPhmIvj3pR/Xuir9Ko8AKKDQPSr
 mfBLn618UgUK6enHElzWJc2dLE4qL3q7aEZGZO3eyalZxJA2uEwK/eK0KojdAtiHtdypYC4Hc85
 70u0PUT+y1oRZo1USrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240069

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

