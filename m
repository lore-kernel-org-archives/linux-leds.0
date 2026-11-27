Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769401;
	b=EX2kJQVhw1adVSc4Eq089MA7qEQdqGCoXgxepbYIqrAZRo1IrhxizyGVNkS+vfHuN43N
	 fjpIfgVoxVumQ+JHZ8z7pOb4kiYAODGtd7qc5zgCR5KMWDCFHFXZaPikKsKzeYMvToaFr
	 CDK8CE7U2cNa+wNI0i2pA3bD5qBnpHY0KTvxQQd9z0Ih/riN/VOzPyX2pnXK1e1j68J7N
	 RDYm7AUhlwLkdmrWRBeOpQ4fihd5INj+hbVqiYR73epea8RP6Tds/Upq7uf4E7/sHcPqE
	 af0iiGBPAGmXQyjc6+JbU1CspSH3ruOz6Ke8qaba8NRbkPiTPUIO/jtj5Gv6GaIqpkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769401;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=;
	b=Ot6g+yf0wcJA+x/K636SZf4NODsM9aQXci5r990qT4mSnLl302msMIVGHUpXozB6P4g/
	 I0FsBPi0fJJECTWDQITxuIcHwbhKqac47YtqrAOoCYdEkPQ6cmdQoTz7OenQIwDVl6rMP
	 wY3hCnQerKxNmcy/xHo//qyrCy6wjhYI9q1tKTr5VihWszpkctrIZC4t8P0n0gMAUPNr+
	 QIs/hZEHl7Veht2fYvQYf8ucgvhtfH5ewapZl7C9M1jYgNo1KzgR9D1C3Go881YjPJ7Oy
	 HG5jcDXJcqc5fS4AQtbFJ7Vc4JOWuUAlpKydsbO366ybjmo3DML1wL1MORqvzY5KarQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dFRCaNK/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0hJj+vR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DA6606A32A
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5DA6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dFRCaNK/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0hJj+vR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Goir560373
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=; b=dFRCaNK/4p7+RnyJ
	Y47wepn4POLlkF1UD1qcJga1XDFTk3yAIKtxnEE6BeqraJQOBrLNcIhfid0FyyNV
	r1/7K2DFVuLPxgqhTF1xp9lhmk9CIrmhforMtEgGaVz8yaejnQMdNoEZm7q5ksAB
	n4vCwAJtOgBp0X1kb1OQmO9xmThCEQpKaGXo0vN4xEQDrtCENvGhs7i4eLcNQbof
	lx34LDhTSVahbEKxcDpsDIT7gAuUqlaawndHezehJPEUzUqyfUolDh57t3+DuMqG
	CtNH/JbvJNzKXu1ov2ltLVmrkqPrKzZUbu7gS346l+yt/TaIeUIpX0iOsn1YPTL6
	eFzaQA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqk3ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:50:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc50d537cd7so272524a12.1
        for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 00:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769399; x=1796374199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=;
        b=W0hJj+vRfLgp8eSspb/yvppLVigfhZfo+1TuSpCEwQ4SeGldcBYS3crDVR/tEfFRrp
         n1m0ZurXcicu6EG/kKysE2k3K8RIRF1jITHqIszAVEzS9xqRte36Lr3TFtukk0ChMuhI
         Atn2vzVMvrOt+9jSSnJEU7Q7T3TMd5qZI5lDftDYdYSOFZGIteP2MXHN3pc8Ow8FuWXq
         3h5zq3tTuHTjzlS42o731yeg6wuGTfA16J3m7g+nJi23fkyCkD/d+D+/IqDYT5dxYCIw
         DhxUMTcRM9CCUZ2d5kXNBw3SAOy5WeyyTxJXibAUuO5DAvNGQV4lrYEWp0Uaw/Xl4hGy
         6jGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769399; x=1796374199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61X0bGYqnRFMaQrWeoLYWuAKAUYyOYJjfd6SJ3/9x7c=;
        b=B3W2FzYw1C+jt5N5anVElDukf/RjJGQDSL7MeBgAku/g/shiQKm+f5MTPs8LlFXypZ
         Qd/gPHbKmMfST/+i8kv6ed3YAGfD+DrJ+E2qnUta8oWIyhvzbT8q7/7E6vsb7n67NxUl
         eFFQM9hNY4Ax4vBgQCYXbKbuSOjoaSUCe3bZh82FOqH/IG0c8a/oHHCsbIdsO3qNp5Ik
         wQtc9W8ZqgLHQVaYvhIYmBX7f0jFctbgl9p6Qi5LHLhwb01RJDQjGK/rrHzwVsTi8JUX
         V3NqFtUVohaPthSL2sNUZS+Vl/2n30vLTpSW+NOUhPXuITIOsN92kzvfegi3Gqr8HM/i
         hITw==
X-Forwarded-Encrypted: i=1; AL+hErFKhsGFbJfQLfstIOSyv5gpOu5wwADbCxiExPIRIYFfLCtvUs9LQ3+fZov8b9q4c7eGl7dO0cWHa5h4@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZzrAAum2z1KKiu3iRkggGoGwD2V9nquAxDZo9n4dk20qvYlf/
	44SuBzK5f828BRXwXZVrNrpJalTCzkEP9I2Wslx97yze6fR4bxSV0sHLUWbvmK/Jcf3gaCN7cmy
	4UEDBx+CsIGDTmFeLuxk1CUV63KMbdH3D+S+xdAFT4tLVWiMdNf6spgf5eSQFVqHq
X-Gm-Gg: AZFdTZdw7QSmM3xvAoDnRMVW9ztnhGei6DYrJ29UPXXTXVigAIdLJg6xf/lXdEgY/sD
	Vut8GmBEcO5/ifagTQGxCZF0VbO8bT+Ry2W6bEgl34UVkDhR9LBFVQqdoOgDDIdgwCK2prPVxCS
	QWWnrzu6PXXMW5klhj0wbaWGpNozunSZ+o2dci+O1qbWL+cZ/30bfoInrLz4sdUdkDZWWUz4eAm
	SMgjCEUy6PqBlKy1inAmFtnutM0+s3PN1wTMb7VHgBaeyfAaC5NgLo3bLvEUqEIcDp2HENVzyjV
	sA75/ksS2k/qgLqkU0ETxhra01VIxoIpLaZj3gQF7Hb1jdup5WXCwtFD0OxpP9xO96qnd9f6hxl
	5r9pmchs3dD+04C7GB5FQjCzmWanhDPSnVuxoJCjaXl3zFKpOTzwOaXo4QZyv+tOV6v7bqGwJmg
	f2a/KHlHjAZ1ObOB9cyUeKvMu5xlIcHViOdmFD3mK46vgNl27kEUvS5P1EmCGYCl9TIEVSREN2+
	7v4C8+SJRtVnM90ql8HMGjFvl7cjg==
X-Received: by 2002:a17:903:298c:b0:2ed:4b23:c41b with SMTP id d9443c01a7336-2f03f151d00mr376294625ad.3.1795769399455;
        Fri, 27 Nov 2026 00:49:59 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ed:4b23:c41b with SMTP id d9443c01a7336-2f03f151d00mr376294345ad.3.1795769399034;
        Fri, 27 Nov 2026 00:49:59 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:58 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:26 +0530
Subject: [PATCH 4/7] leds: qcom-lpg: Add PM7550 PWM compatible
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-eliza_disp_all-v1-4-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=1089;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=tkx+9mrW5AZ+HOy6XzHglysRWK78jQma1MhEIAFTTJo=;
 b=8s59DlyRSZewARMpmXDeN0BjCap++JIQsz8Fj8QZAwu5z52tfIwwDwzARFsRver9MLXktwHAL
 GkoYA3WNzQmBx2LBkykLEnVO14r488O89BTrGA8krDwxPGxcenNWjyk
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: ynB2ewxvx7u5_hLgo7CuNcxccyGahE_z
X-Proofpoint-ORIG-GUID: ynB2ewxvx7u5_hLgo7CuNcxccyGahE_z
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b094438 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8FmHkYH7MGniFFCvUCUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX9vkruBUPlKzO
 QI0z+DGtq7r1hWXTA/PXo5ImUHTxvZbPRk7Cnc4+3wleTtVPS1n/fDP1508eZ1sYAKntu0+giUT
 mA1nD1+U1pRi1xTIRHyPJA8ISv8Mems=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXw4KuGJ0Ox6lC
 NOtdSLRVkUerujSYQpYLo3/EtI1tPTHTg6T6HYd2Hq5hFFmIvb+NBFr92RBpnN8SuujAYwk6qn/
 1cnQ63gnREDVwaF0XXafv6ICo0/fhTzKTWXu6rYzxYLHSVHL2KDPKvz+rSZIafpaafYWwHIXcg2
 X9E0ax/nV36zMA83WiABeiYf4aO45pQyyunGTwbcHw1PgkMXpblmGHOfXLlHWov2TVRdrAY1GOR
 8/iqR8mpPO58w6OBEC0e3IEG/bD9wUBiASTCGphz8/s6ccnzQkGEffS6HWS57/gQT4Pu4Fe+hrj
 odCD/eJEzUiYZHtvUvOZhk/G4acK0QnqYpzpEJJ9z0+NGjIzgk0zYxg9UjSnqY5y1g0n5HTlr8a
 8Q5isqPzTJ4Pe9FkGaIfrhAlrFgqEME+mhbwZ0dsM4pYKWXJrXoa0Dsu33oTDjDCVwqzlaQ3ILE
 qwo5pM7/oDBDltZcRgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

PM7550 provides an LPG block compatible with the PM8350C PWM programming
model.

Add the PM7550 PWM compatible to the LPG OF match table and reuse the
existing PM8350C PWM data.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 98e39e03b9a1..6c9cbc75bbfb 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1827,6 +1827,7 @@ static const struct of_device_id lpg_of_table[] = {
 	{ .compatible = "qcom,pm660l-lpg", .data = &pm660l_lpg_data },
 	{ .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data },
 	{ .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data },
+	{ .compatible = "qcom,pm7550-pwm", .data = &pm8350c_pwm_data },
 	{ .compatible = "qcom,pm8350c-pwm", .data = &pm8350c_pwm_data },
 	{ .compatible = "qcom,pm8916-pwm", .data = &pm8916_pwm_data },
 	{ .compatible = "qcom,pm8941-lpg", .data = &pm8941_lpg_data },

-- 
2.34.1

