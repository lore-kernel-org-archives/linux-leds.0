Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D97E732CC
	for <linux-leds@archiver.kernel.org>; Thu, 28 Sep 2023 13:10:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbjI1NKG (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 28 Sep 2023 09:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232600AbjI1NKF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 28 Sep 2023 09:10:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F46F199;
        Thu, 28 Sep 2023 06:10:03 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4134BC433C8;
        Thu, 28 Sep 2023 13:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695906603;
        bh=GLVG9ldXyJU6qewPVL4UMRgmAme+5Qm869GRWAEEMoA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bJXtpu6sUggzT2YIoRwqecDse1Tdkpvkb8C1qJ0i1WD9bIhbeHqT22lmudzlCxgCV
         hrJ7qzQzHh7ibpP8bLWIYz6nh+5IxVsmMN9oiVakOWYG4CgdXUQ6aA7jZdMst1Vimd
         LFP60ebWQ23Pkx8nZcyUr9BlTOvi0LAjtPfZFCyDHt41nOcEY9yFbEDchfXUFSYpzR
         t3aXo6vGnWmz+nPHJk5VztLwmq1J89XTcQG2ZD4+JRzq06lMqrF9JHQCy8dFwA9nZw
         vrn57oB6EbSwjzzCKCsrzccz3PL1K933E2Ed4qGQuIoOBVkWoKKvrrXvdKxexoVuCx
         0SkLYf7cQPGNg==
Date:   Thu, 28 Sep 2023 14:09:58 +0100
From:   Lee Jones <lee@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Pavel Machek <pavel@ucw.cz>, Bryan Wu <bryan.wu@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jamie Iles <jamie@jamieiles.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: ledtrig-cpu:: Fix a warning when
 compiling with W=1
Message-ID: <20230928130958.GH9999@google.com>
References: <3f4be7a99933cf8566e630da54f6ab913caac432.1695453322.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f4be7a99933cf8566e630da54f6ab913caac432.1695453322.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 23 Sep 2023, Christophe JAILLET wrote:

> In order to teach the compiler that 'trig->name' will never be truncated,
> we need to tell it that 'cpu' is not negative.
> 
> When building with W=1, this fixes the following warnings:
> 
>   drivers/leds/trigger/ledtrig-cpu.c: In function ‘ledtrig_cpu_init’:
>   drivers/leds/trigger/ledtrig-cpu.c:155:56: error: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size 5 [-Werror=format-truncation=]
>     155 |                 snprintf(trig->name, MAX_NAME_LEN, "cpu%d", cpu);
>         |                                                        ^~
>   drivers/leds/trigger/ledtrig-cpu.c:155:52: note: directive argument in the range [-2147483648, 7]
>     155 |                 snprintf(trig->name, MAX_NAME_LEN, "cpu%d", cpu);
>         |                                                    ^~~~~~~
>   drivers/leds/trigger/ledtrig-cpu.c:155:17: note: ‘snprintf’ output between 5 and 15 bytes into a destination of size 8
>     155 |                 snprintf(trig->name, MAX_NAME_LEN, "cpu%d", cpu);
>         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes: 8f88731d052d ("led-triggers: create a trigger for CPU activity")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/leds/trigger/ledtrig-cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I made the subject line less generic and applied it, thanks.

-- 
Lee Jones [李琼斯]
