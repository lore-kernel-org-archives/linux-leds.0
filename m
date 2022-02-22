Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C7EC433FE
	for <linux-leds@archiver.kernel.org>; Tue, 22 Feb 2022 05:55:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbiBVF4T (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 22 Feb 2022 00:56:19 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:54604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbiBVF4O (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Feb 2022 00:56:14 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D7D4EA0C;
        Mon, 21 Feb 2022 21:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645509350; x=1677045350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=LCfoUTJcAxlHxtZzLst95GG117Schc5GJDkOOtS+B0A=;
  b=VJMQLNOGXVwPXI04c4+lgFLoaGwxiPiiUgYSdrXbpxPh7mU9hFvz2hsa
   ebxp2MxG8XrlMEAiFz8Tu9fvNq0Tx9S3B5kxbK+QehJmz7bQjlu5aNKqZ
   5+V9GQ5wiHEldSz4WZE1MHtG95tx2hohcuUubCQT7gE5gwKb4VVNjJ+3d
   k=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 21 Feb 2022 21:55:49 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 21:55:49 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 21 Feb 2022 21:55:49 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 21 Feb 2022 21:55:45 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        "Doug Anderson" <dianders@chromium.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH V4 3/4] arm64: dts: qcom: pm8350c: Add pwm support
Date:   Tue, 22 Feb 2022 11:25:08 +0530
Message-ID: <1645509309-16142-4-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645509309-16142-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1645509309-16142-1-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add pwm support for PM8350C pmic.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in V2:
 - Dropped suffix '4' from pwm phandle and removed "status=ok".

Changes in V3:
 - Add reg property.

Changes in V4:
 - No Changes.

 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index e1b75ae..1ba6318 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -29,6 +29,13 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pm8350c_pwm: pwm@e800 {
+			compatible = "qcom,pm8350c-pwm";
+			reg = <0xe800>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.7.4

