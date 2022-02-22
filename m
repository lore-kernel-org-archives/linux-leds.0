Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D7EC433F5
	for <linux-leds@archiver.kernel.org>; Tue, 22 Feb 2022 05:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbiBVF4J (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 22 Feb 2022 00:56:09 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:54142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbiBVF4I (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Feb 2022 00:56:08 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FC82B26F;
        Mon, 21 Feb 2022 21:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645509342; x=1677045342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=9d618VuAFcZLjSxXSiO48GqmOlIllscxot2/zXxFAzs=;
  b=UYbCVeI/n/+Tkh6xcxd1c2a5YT6eZIF+Em/CZT1biNYH8eK2Ohpj1nlO
   JGkce54QDH1l3ovYB5dD6pWoKezzb2JjIGZDrmwtNcboHQK8mQiL3hGIB
   OCudBVBd7InkvwVIc7ZHUN+Iqh9gserWkZs/KZFqqD5DyfutHThdZS0ks
   A=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 21 Feb 2022 21:55:42 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 21:55:41 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 21 Feb 2022 21:55:41 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 21 Feb 2022 21:55:37 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        "Doug Anderson" <dianders@chromium.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH V4 1/4] dt-bindings: leds: Add pm8350c pmic support
Date:   Tue, 22 Feb 2022 11:25:06 +0530
Message-ID: <1645509309-16142-2-git-send-email-quic_c_skakit@quicinc.com>
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

Add pm8350c pmic pwm support.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in V2:
 - No changes.

Changes in V3:
 - No changes.

Changes in V4:
 - No changes.

 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 336bd8e..409a4c7 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,pm8150b-lpg
       - qcom,pm8150l-lpg
+      - qcom,pm8350c-pwm
       - qcom,pm8916-pwm
       - qcom,pm8941-lpg
       - qcom,pm8994-lpg
-- 
2.7.4

