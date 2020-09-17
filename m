Return-Path: <SRS0=SVrG=C2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C662C43461
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 17:45:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C1472065E
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 17:45:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GEfHVVtL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgIQRpj (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Sep 2020 13:45:39 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35458 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgIQRp3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 13:45:29 -0400
X-Greylist: delayed 8163 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 13:45:28 EDT
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08HFSIAH001723;
        Thu, 17 Sep 2020 10:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600356498;
        bh=siJy1EKhfjcCdqMsI44fOj+ia0rT8MmnXgBZFzQBwXo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GEfHVVtLScqsGacz35p+/ydlG5RjUshjuqP94zp27F9YoBD0JEfaaMIsoDK0rOeko
         sWrm8mt1zKdawK13663snGOuwpqjHpZajY6oDox0TzUs1Bez9FMrBMrwX5rJvxsyEC
         l+i40ywgWYTCpsK0jwf9vErrkCZhgVzRv55UfYro=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08HFSIVw020538
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 17 Sep 2020 10:28:18 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Sep 2020 10:28:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Sep 2020 10:28:18 -0500
Received: from [10.250.32.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HFSIxJ025276;
        Thu, 17 Sep 2020 10:28:18 -0500
Subject: Re: [PATCH leds v1 09/10] leds: lm36274: use struct led_init_data
 when registering
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        <linux-leds@vger.kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>,
        <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <20200916231650.11484-1-marek.behun@nic.cz>
 <20200916231650.11484-10-marek.behun@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <7940ab2f-f4a5-c909-9270-4b713b76261d@ti.com>
Date:   Thu, 17 Sep 2020 10:28:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916231650.11484-10-marek.behun@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 9/16/20 6:16 PM, Marek Behún wrote:
> By using struct led_init_data when registering we do not need to parse
> `label` DT property nor `linux,default-trigger` property.
>
> A small refactor was also done:
> - with using devm_led_classdev_register_ext the driver remove method is
>    not needed
> - since only one child node is allowed for this driver, use
>    device_get_next_child_node instead of device_for_each_child_node
>
> Previously if the `label` DT property was not present, the code composed
> name for the LED in the form
>    "parent_name::"
> For backwards compatibility we therefore set
>    init_data->default_label = ":";
> so that the LED will not get a different name if `label` property is not
> present.

You are going to re-factor this as well a lot of changes in a single 
patch is hard to review

Dan

