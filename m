Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD4EC7619A
	for <linux-leds@archiver.kernel.org>; Sun,  2 Apr 2023 21:58:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjDBV62 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 2 Apr 2023 17:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDBV61 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 2 Apr 2023 17:58:27 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D2B6E8D
        for <linux-leds@vger.kernel.org>; Sun,  2 Apr 2023 14:58:26 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id F12EE85B57;
        Sun,  2 Apr 2023 23:58:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1680472703;
        bh=/DPgrWv2eqUsvJRttLOnFoP/F/mH31wuOB92pEp95VA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=FPEcOzDW+DH1bfaLvi+9mEjNHqUDNvI0FyUTi+z136cQh/JaWhlmuV8ELosj0pVXI
         +wzM5E+pAabgxB2G642trlnH+fw8cedToBX+MMKtRiMhxQHys7agklW8Iy+xfNoPgI
         Y9yJ8QWjUMc//bt38PSDaaYfX0it8ql7EtL4EcbBNU0JkR3+nvjm3IGiRfzBacSVhx
         34NVyk5q8FQkVUaDM3WpvoplXyB/kYlmrGXo7URndLQ/MvMnpMmquxilWOFcnrBYD0
         RKn4rkBaJAaE8AasHX9A7ltiMrINW0/4PqxRBP54XUVGfCAW4hP8ErFThgN587DM7w
         ve12B1I2rudaQ==
Message-ID: <5156c474-9f44-6cda-6090-c3e58f7459f0@denx.de>
Date:   Sun, 2 Apr 2023 23:58:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] leds: gpio: Configure per-LED pin control
Content-Language: en-US
To:     Pavel Machek <pavel@ucw.cz>, lee.jones@linaro.org
Cc:     linux-leds@vger.kernel.org,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>
References: <20221107003133.377704-1-marex@denx.de>
 <ZCGE/6hzeJNeJKTj@duo.ucw.cz>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <ZCGE/6hzeJNeJKTj@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 3/27/23 13:58, Pavel Machek wrote:
> Hi!
> 
>> Each gpio-leds DT node DT subnode can have a pinctrl property assigned
>> to it, parse the DT subnode pinctrl properties and configure each pin
>> accordingly.
> 
> Do we need update to
> Documentation/devicetree/bindings/leds/leds-gpio.yaml ?

As far as I can tell, no. The pinctrl properties are generic and outside 
of the leds-gpio yaml schema.
