Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71D3C7EE22
	for <linux-leds@archiver.kernel.org>; Mon, 15 May 2023 15:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234849AbjEOPHv (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 15 May 2023 11:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242057AbjEOPHu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 May 2023 11:07:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8BA113
        for <linux-leds@vger.kernel.org>; Mon, 15 May 2023 08:07:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7C0D5618A2
        for <linux-leds@vger.kernel.org>; Mon, 15 May 2023 15:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5EBC433EF;
        Mon, 15 May 2023 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684163268;
        bh=D7IUDbGt6M+sxefBd5ig+qF0m7ouAP18i1VD2Y1hwQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=flLD2CNd976+l3QSiUtJDkRpBAqW4+YoDyjiAvH6Fi0oRwLRnd4wwwqlDjlxv5nKA
         jHj5jPK3LPVuXswKzq0kFEaT0ZgEr4apM8mJBQlYRzew70mvQcBYXuRNmpKESLPwOe
         8n99I+prFhl6NeImEOk69OCfkr2akSuehYTqDIrZYSaAFz5fvTyFBdrDSg7FoTeQS6
         xkkROuZLcSI4Kxnndu0AIWOD6rl625Imu78ZB6TKkj0crKxe4FW18lcqDvU0+56ZKm
         unAZV/OwtUeg23Q44Tay3PWl7qFFKixJcW36ac3C5ar8RATJDBqUnOst/It1Ze9A6M
         y8rkW0jYtmg+g==
Date:   Mon, 15 May 2023 16:07:44 +0100
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 5/5] leds: cht-wcove: Use breathing when
 LED_INIT_DEFAULT_TRIGGER is set
Message-ID: <20230515150744.GL10825@google.com>
References: <20230430195952.862527-1-hdegoede@redhat.com>
 <20230430195952.862527-6-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230430195952.862527-6-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 30 Apr 2023, Hans de Goede wrote:

> The desired default behavior of LED1 / the charge LED is breathing
> while charging and on/solid when full. Since triggers cannot select
> breathing, blink_set() gets called when charging. Use breathing
> when the default "charging-blink-full-solid" trigger is used to
> achieve the desired default behavior.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Also set on/off delay to 1000 so that we get a slow breathing effect,
>   this counter-acts the v2 cht_wc_leds_set_effect() change changing
>   the default delays from 1000 to 500
> ---
>  drivers/leds/leds-cht-wcove.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
