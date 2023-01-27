Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C839EC61DA4
	for <linux-leds@archiver.kernel.org>; Fri, 27 Jan 2023 11:07:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbjA0LHd (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 27 Jan 2023 06:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232848AbjA0LHd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 27 Jan 2023 06:07:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA194CE4E;
        Fri, 27 Jan 2023 03:07:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DACF261AE4;
        Fri, 27 Jan 2023 11:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B66C4339B;
        Fri, 27 Jan 2023 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674817651;
        bh=KbG6BrFKfXVEkvYoaHen26R6y+mOuPj2l0a5MFMcXOM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gOxJDaoR+nZL8rdOMFqbT10ZqXud0+j6MqMfK28eMz+ws7eGvoMl+uBI4Quzyrryb
         Uf2sHJqLYaMg52KS2KJ3dPy3mLbz5a9TofbDub4a/SRW5XG6CJbCFSD2Zf/9ebMsIP
         ezsMA5DchEN61dUs74kG16T/08R6sUNh1LpYS9znAVS1dEsBhY16vk7qTZ3SlwwWuy
         dKxv/49TFVTvDJm9Z60DUgNibO5Ja7Gu67GAFS/AmDib5B8qWdIi9gUvwqGzw2+WG2
         6PInYQ3Kax+pcMJtJcaohbat1gw2rsHl2FDH+mYsU/TiJDDFuwsGpSrQkumCtbM0/w
         JjFYqQSaS+ekw==
Date:   Fri, 27 Jan 2023 11:07:24 +0000
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 04/11] leds: led-class: Add generic [devm_]led_get()
Message-ID: <Y9OwbMrqkBc1atAi@google.com>
References: <20230120114524.408368-1-hdegoede@redhat.com>
 <20230120114524.408368-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120114524.408368-5-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 20 Jan 2023, Hans de Goede wrote:

> Add a generic [devm_]led_get() method which can be used on both devicetree
> and non devicetree platforms to get a LED classdev associated with
> a specific function on a specific device, e.g. the privacy LED associated
> with a specific camera sensor.
> 
> Note unlike of_led_get() this takes a string describing the function
> rather then an index. This is done because e.g. camera sensors might
> have a privacy LED, or a flash LED, or both and using an index
> approach leaves it unclear what the function of index 0 is if there is
> only 1 LED.
> 
> This uses a lookup-table mechanism for non devicetree platforms.
> This allows the platform code to map specific LED class_dev-s to a specific
> device,function combinations this way.
> 
> For devicetree platforms getting the LED by function-name could be made
> to work using the standard devicetree pattern of adding a -names string
> array to map names to the indexes.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v5:
> - Rename lookup-table names to match those from the gpio and reset lookups:
>   s/led_name/provider/
>   s/consumer_dev_name/dev_id/
>   s/consumer_function/con_id/
> 
> Changes in v4:
> - Split out support for led_get() devicetree name-based lookup support
>   into a separate RFC patch as there currently are no users for this
> - Use kstrdup_const() / kfree_const() for the led_name
> ---
>  drivers/leds/led-class.c | 84 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/leds.h     | 21 ++++++++++
>  2 files changed, 105 insertions(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
