Return-Path: <SRS0=V8yO=VF=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69B3C606BD
	for <linux-leds@archiver.kernel.org>; Mon,  8 Jul 2019 18:03:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F0A021874
	for <linux-leds@archiver.kernel.org>; Mon,  8 Jul 2019 18:03:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Zex9v9fY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728793AbfGHSDB (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 8 Jul 2019 14:03:01 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45934 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727413AbfGHSDB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Jul 2019 14:03:01 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68I2pM2047759;
        Mon, 8 Jul 2019 13:02:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562608971;
        bh=gCVJdCJhOuBj+s1tpW3aHcSTDf/4h8j7xDhTsbbntpw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Zex9v9fYpK9P9FJArcOrRkHIxc5liW5n3jTKlUu2erCIFlqDEneyO7RSGHgwLxVMb
         E8dG1bHdLu6TMsSK50wac9QaPZ7ORQQgbIw1O9Z1rfwZu6Gb90sNHPYZnP//Ic1hfW
         k14egafNPi7SDCha/15Sekl+7Fq6Fw2wXvYx97rU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68I2oAi097972
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 8 Jul 2019 13:02:51 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 13:02:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 13:02:50 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68I2oNO005559;
        Mon, 8 Jul 2019 13:02:50 -0500
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
To:     Brian Dodge <bdodge09@gmail.com>, <pavel@ucw.cz>
CC:     <daniel.thompson@linaro.org>, <lee.jones@linaro.org>,
        <jingoohan1@gmail.com>, <jacek.anaszewski@gmail.com>,
        <robh+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <pbacon@psemi.com>
References: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
 <1561940895-15837-2-git-send-email-bdodge09@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <f2cf7c51-4857-30bd-a096-b1ce5ff01bd5@ti.com>
Date:   Mon, 8 Jul 2019 13:02:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561940895-15837-2-git-send-email-bdodge09@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org
Message-ID: <20190708180209.nXUPy3Xx4StoYodQjuMFD7hT2hxqozJQIcot6ELhw18@z>

Brian

On 6/30/19 7:28 PM, Brian Dodge wrote:
> The vendor-prefixes.txt file properly refers to ArcticSand
> as arctic but the driver bindings improperly abbreviated the
> prefix to arc. This was a mistake in the original patch. This
> patch adds "arctic" and retains "arc" (deprecated) bindings
>
> Signed-off-by: Brian Dodge <bdodge09@gmail.com>
> ---
>   .../bindings/leds/backlight/arcxcnn_bl.txt         | 31 +++++++++++++++-------
>   1 file changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> index 230abde..4d98394 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> +++ b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> @@ -1,8 +1,13 @@
> -Binding for ArcticSand arc2c0608 LED driver
> +Binding for ArcticSand arc family LED drivers
>   
>   Required properties:
> -- compatible:		should be "arc,arc2c0608"
> -- reg:			slave address
> +- compatible: one of
> +	"arctic,arc1c0608"
> +	"arctic,arc2c0608"
> +	"arctic,arc3c0845"
> +	"arc,arc2c0608" (deprecated)
> +
> +- reg:		slave address
>   
>   Optional properties:
>   - default-brightness:	brightness value on boot, value from: 0-4095
> @@ -11,19 +16,25 @@ Optional properties:
>   - led-sources:		List of enabled channels from 0 to 5.
>   			See Documentation/devicetree/bindings/leds/common.txt
>   
> -- arc,led-config-0:	setting for register ILED_CONFIG_0
> -- arc,led-config-1:	setting for register ILED_CONFIG_1
> -- arc,dim-freq:		PWM mode frequence setting (bits [3:0] used)
> -- arc,comp-config:	setting for register CONFIG_COMP
> -- arc,filter-config:	setting for register FILTER_CONFIG
> -- arc,trim-config:	setting for register IMAXTUNE
> +- arctic,led-config-0:	setting for register ILED_CONFIG_0
> +- arctic,led-config-1:	setting for register ILED_CONFIG_1
> +- arctic,dim-freq:	PWM mode frequence setting (bits [3:0] used)
> +- arctic,comp-config:	setting for register CONFIG_COMP
> +- arctic,filter-config:	setting for register FILTER_CONFIG
> +- arctic,trim-config:	setting for register IMAXTUNE
> +- arc,led-config-0:	setting for register ILED_CONFIG_0 (deprecated)
> +- arc,led-config-1:	setting for register ILED_CONFIG_1 (deprecated)
> +- arc,dim-freq:		PWM mode frequence setting (bits [3:0] used) (deprecated)
> +- arc,comp-config:	setting for register CONFIG_COMP (deprecated)
> +- arc,filter-config:	setting for register FILTER_CONFIG (deprecated)
> +- arc,trim-config:	setting for register IMAXTUNE (deprecated)
>   
>   Note: Optional properties not specified will default to values in IC EPROM
>   
>   Example:
>   
>   arc2c0608@30 {
> -	compatible = "arc,arc2c0608";
> +	compatible = "arctic,arc2c0608";
>   	reg = <0x30>;
>   	default-brightness = <500>;
>   	label = "lcd-backlight";


Reviewed-by: Dan Murphy <dmurphy@ti.com>

