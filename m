Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB2045517C
	for <linux-leds@vger.kernel.org>; Thu,  3 Sep 2026 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434886; cv=none; b=FBV+oCFDpz8FzKE9XBZqjGarI9GoNcl7GWLKtdSYHRRFYGxe6AO7RM/p48HKrDJrAG7JF8JbMRVOKGxe+Pi2db2QIWqP1KB6YGs430E8h+VD6oVFI8O+/hdocnJL7+MWXruYSF3mgFgGfxpM+dIsXlVciv8REOS5WaUJxdre2r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434886; c=relaxed/simple;
	bh=Z45IKqKNmKHMoDxnTs1W9/1hhzkoL1sjpuMqPRPU54U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSfAKn681RHX/bcUQooOk9ZPMExog+XyWih9vzmkXplZUYBvzgTH5+JJU8gbuzhO/dSj4FIZ0FFgKsl01iE5CyYLWARQVJP1LrLbi7j6Afmuj1eC9oBpfkUT9PedzNs9pJG3d6NAvpYmAZc/KPT9wfS1/pU9uhTMCjJQOdb4oyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5tsVqlu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYcXrcZj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5tsVqlu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYcXrcZj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHAZ23782251
	for <linux-leds@vger.kernel.org>; Thu, 3 Sep 2026 11:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZoiINMgbp5hKUHJne2KrubQpmenpvQCezic7fpoj7E=; b=n5tsVqlu08K2ECY9
	mJjVCzKlbOrlYE8NezbdYjdU9cm3Vxro63CbYswlKBQwE+PM0mYnHKEkC2H5pcNz
	EkRveaEDet+OB3UOjT6DVvTQjp8tlJQBIBtvnGF+L0f05s6gBAciXoaQTRrDJ1oD
	ArllJBbAuq0LqQHyCXvE0vA/Cy0r2xbNwNAr0vSZ9zmC//VLQq7nJ9XqO7/Eh/Mr
	+M13hDqvW765GgZY0/Y/DL+LgvXaaP0Y96GTxpbktxnAYck7jz3PNeL6JahLg/fI
	+AXapsbMbfZZ2dL1v6u31aVZV+EOnbPeHwZA+hNew0JxzNisjqZTc4w1nt+U3aU8
	9FA0fw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdrn22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 03 Sep 2026 11:27:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so57716185a.2
        for <linux-leds@vger.kernel.org>; Thu, 03 Sep 2026 04:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788434878; x=1789039678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZoiINMgbp5hKUHJne2KrubQpmenpvQCezic7fpoj7E=;
        b=NYcXrcZjcGcj6bfh6QdG3kGG+4bHN6uAb5PB4u+lyEyg5cQb78gHIU2QlcrYZTw+T/
         QwN/8YfAZu+93dj9cjLagXroLBxoaDAq/QI4S7RUwj9hGBQ/7sWutyq/QnQAWLb1QaSR
         XV8cjZNZMk9H+FNlDDAbHwOBbiXZuOl5FBvdlozMIN2nolDP3Cn6clqIhZmWj5/ICICR
         b52SIXKbsOZvicv5k1abP3Ldru2CRo0qPbbKT89yvToYpct3CRuXdfmt7u2OTE7sT44t
         5Fni6pfw7q4WCcIWJiqDRw+OZ5jI0/2SnG5/mO6cVi56FyROkRXS9qbubp984apJlTJ3
         tdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434878; x=1789039678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZoiINMgbp5hKUHJne2KrubQpmenpvQCezic7fpoj7E=;
        b=kOlH7OI3IRZUlffyO5XrGWt9TPQWgdYkkKhH0c4MHLEtlLFWkGuYx9f27tM/y6f0j4
         5PTGSp6F/KSTA6Fv5nsPUHylYfHj4ESeo222DtDwmKM2KZIbdoNsYznLOyALtoUoOdzX
         IBESoIXUvjhpYif0R3xq5gcWONn5v40prdyNGkK28AVi8AR8T4IFgIB1D3vusT2e50UH
         FivkzGXfh5k7YA6obF+ABbXAqL/Q2no+6K6xyuwhnFaFvuzYeQ9cqPClTbv0cDnVcAAw
         NXwtCQ/jnFQy+LpmgWFVtPJYArdbOjrV1IWFkTx6PtS+/YTV8Xexr3pbyfVK0GuSxguC
         kIuw==
X-Forwarded-Encrypted: i=1; AKwUvBxs1vO1cvUporsl2YrlJKLQWlpWoWvmzz13hemlWob1ILNyTtAV5aebtmFg0GDRi2/Bd25rcjFoVXDm@vger.kernel.org
X-Gm-Message-State: AFuF++mLngUWsd63fpm6Qrq4pAoKIQB6O16Iewjt3XlROzYiWswTXfbW
	hgIPEblJ5dmAOTg8kdNbRVwuOq7UfvdvLUt3dcKH9tYkoKIR14uKBk8rtZLEe9whPK5eeLDYeCt
	ygCGd/28N5acC6dkvxNiBVS0USm6m2IltOTDPacv1/gYcl8P7Skh3fuPSEfqVOnsT
X-Gm-Gg: AYBFou04c/t0BAoGX57B8iqw89rX5cfNHZED27xku/OUriNE+TPss0qR+Nd5ruEjPuS
	rYOxU5jDRwBzpfud9/s4gQITQ4kz0F09Xzk6rth1m3lGruVAYgBGEaPituIt7ISLtpbWKwJ8D9d
	rIt/4AkQAJ4c8w9f+h4hw6+upSApuX0r+uURryDrMj4bR0Txr9gfOEkRcPd43QSAlVJ66AlSBcp
	hMpOM+5VR8SXWV7o13aRrw7pUxBE772Iy9hIMSJxcJibm1Kt9WFd08KPS8YGujq17bgOjWhPyZj
	PUbZ+FIj4Dz/+dRuzd157pF22RfjRUflwn3EtGyrQ+RpSqIa8Km5GsxXYef80IKChlYRQQbHSt4
	OcSH3MEuHaqJnpGr8FUj/Kw==
X-Received: by 2002:a05:620a:270b:b0:939:4a24:4de4 with SMTP id af79cd13be357-9396107ce10mr867217785a.5.1788434878362;
        Thu, 03 Sep 2026 04:27:58 -0700 (PDT)
X-Received: by 2002:a05:620a:270b:b0:939:4a24:4de4 with SMTP id af79cd13be357-9396107ce10mr867212985a.5.1788434877711;
        Thu, 03 Sep 2026 04:27:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4244e45sm86239866b.60.2026.09.03.04.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:27:56 -0700 (PDT)
Message-ID: <de251a59-1ace-4b9c-beb2-99fe6f3cb842@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:27:53 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfX7pwePPhwORDD
 HxSbXwto0PzjbPadr0Mwy2G7a9vR1X+nuHJSGjjPg/gJ7DI9yNiUU4YMoIhAf8djgpr4wZiRXHT
 Y50uLmH1c4MVRbek4nB82+/lQkVZ2wY=
X-Proofpoint-ORIG-GUID: gVzSQ8UiF-8JDnL5X8qc8ZXgp1ZZFYt8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfX/F5/gdAEXbHr
 ta0pHsfPxDtW3ooaeagwviqMzfuRpa3o3NLSXcGuhgg/dycAGCulM6XFiJ2Q+AkN2UXAAY/JHoV
 QA5bG0GgFNhDDA8HgRyGmuXeWABeXHtDp5Ox3X0xp3AvUs3xgIjGU4XWUXpphB24/+HkBELWZFb
 UQTpPAXpMRPwvPleyl/ZCOuIkl5nR+gA+aErF4OV1U1Ub3kSKvhaDeOEBKmByZ8Ix2KlZn42pix
 CuQJxQ7s2K2YN7z9oeo7AW83gzgb49RIHg2f0AalhHkjI0IVgOSS4tWkSPxMglnY9SKj0dzTUkV
 d7yBWtb4COEk+TpACKY50z/7LiYXXRd1cdjAwgD68eIslsfiS+eE1KBYJeVEJLXuOYu5bh9CGgm
 J6ckSAwEaHXgvhDG8qqSan6N0HVWjcXnKE/q7QACsK50Dv2239G6aMwYWKvXP64KBusP+NfAmoZ
 Se8lKoqDwcam64E7s5A==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a9959bf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rCHStms5JtS70C2hfqUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: gVzSQ8UiF-8JDnL5X8qc8ZXgp1ZZFYt8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030099

On 7/17/26 6:41 AM, Fenglin Wu wrote:
> Currently, when the LED is configured as a RGB LED or a multi-color
> LED device, the same pattern is programmed for all LED channels
> regardless of the sub-led intensities when triggered by HW pattern.
> It results that the LED device is always working in a white-balanced
> mode regardless of the intensity settings.
> 
> To fix this, scale the pattern data according to the sub-led intensity
> and program the HW pattern separately for each LPG channel.
> 
> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
> Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

GPT came up with the following fixes/suggestions:

1] This one makes sense at a glance:

    leds: rgb: leds-qcom-lpg: Skip LUT allocation for off colors
    
    Multicolor hardware pattern setup programs a separate LUT range for every
    component. A component with zero calculated brightness is disabled before
    the pattern is applied, so its all-zero range is never used.
    
    Skip allocating it to preserve the shared LUT capacity.
    
    Fixes: 2882fa0dc1cf ("leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode")

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24b1f570f524..e32388a16537 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1219,6 +1219,13 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
                chan = led->channels[i];
                scale = mc->subled_info[i].brightness;
 
+               /* An off component neither needs nor uses a LUT range. */
+               if (!scale) {
+                       chan->pattern_lo_idx = 0;
+                       chan->pattern_hi_idx = 0;
+                       continue;
+               }
+
                for (j = 0; j < pattern.len; j++) {
                        scaled[j].brightness = DIV_ROUND_CLOSEST(
                                (u32)prep_data[j].brightness * scale, LED_FULL);


2] This one.. I'm not convinced..

    leds: rgb: leds-qcom-lpg: Reuse LUT patterns for equal colors
    
    Multicolor hardware patterns with equal nonzero component brightnesses
    produce identical LUT data. Reuse their LUT range instead of allocating
    and programming duplicate data.
    
    Free each shared range once when clearing a pattern or unwinding a failed
    allocation.

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index e32388a16537..1c4d550c1ed0 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1175,6 +1175,34 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
 	return 0;
 }
 
+static void lpg_pattern_free(struct lpg_led *led, unsigned int count)
+{
+	struct lpg_channel *chan;
+	unsigned int i, j;
+
+	for (i = 0; i < count; i++) {
+		chan = led->channels[i];
+		if (chan->pattern_lo_idx == chan->pattern_hi_idx)
+			continue;
+
+		for (j = 0; j < i; j++) {
+			if (chan->pattern_lo_idx == led->channels[j]->pattern_lo_idx &&
+			    chan->pattern_hi_idx == led->channels[j]->pattern_hi_idx)
+				break;
+		}
+
+		if (j == i)
+			lpg_lut_free(chan->lpg, chan->pattern_lo_idx,
+				     chan->pattern_hi_idx);
+	}
+
+	for (i = 0; i < count; i++) {
+		chan = led->channels[i];
+		chan->pattern_lo_idx = 0;
+		chan->pattern_hi_idx = 0;
+	}
+}
+
 static int lpg_pattern_mc_set(struct led_classdev *cdev,
 			      struct led_pattern *led_pattern, u32 len,
 			      int repeat)
@@ -1226,6 +1254,17 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
 			continue;
 		}
 
+		for (j = 0; j < i; j++) {
+			if (scale == mc->subled_info[j].brightness) {
+				chan->pattern_lo_idx = led->channels[j]->pattern_lo_idx;
+				chan->pattern_hi_idx = led->channels[j]->pattern_hi_idx;
+				break;
+			}
+		}
+
+		if (j != i)
+			continue;
+
 		for (j = 0; j < pattern.len; j++) {
 			scaled[j].brightness = DIV_ROUND_CLOSEST(
 				(u32)prep_data[j].brightness * scale, LED_FULL);
@@ -1238,14 +1277,7 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
 			ret = lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
 
 		if (ret < 0) {
-			/* Free LUT slots already allocated for previous channels */
-			while (i-- > 0) {
-				chan = led->channels[i];
-				lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
-				chan->pattern_lo_idx = 0;
-				chan->pattern_hi_idx = 0;
-			}
-
+			lpg_pattern_free(led, i);
 			return ret;
 		}
 
@@ -1271,13 +1303,12 @@ static int lpg_pattern_clear(struct lpg_led *led)
 
 	mutex_lock(&lpg->lock);
 
+	lpg_pattern_free(led, led->num_channels);
+
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
-		lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
 		lpg_sdam_configure_triggers(chan, 0);
 		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
-		chan->pattern_lo_idx = 0;
-		chan->pattern_hi_idx = 0;
 	}
 
 	mutex_unlock(&lpg->lock);
