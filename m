Return-Path: <SRS0=X9ll=DC=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E094AC4363D
	for <linux-leds@archiver.kernel.org>; Fri, 25 Sep 2020 14:36:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01AD320708
	for <linux-leds@archiver.kernel.org>; Fri, 25 Sep 2020 14:36:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="v1x92o6z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728996AbgIYOg5 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 25 Sep 2020 10:36:57 -0400
Received: from lists.nic.cz ([217.31.204.67]:45444 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728888AbgIYOg5 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 25 Sep 2020 10:36:57 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 396021405CD;
        Fri, 25 Sep 2020 16:36:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1601044616; bh=RPjj02PN7wPdQL0DWK37K5WgyYWkBRmPge9TVweysEQ=;
        h=Date:From:To;
        b=v1x92o6zR+rVTebXAfiTmP6+9wTf0MuxAeZvk0waqnDrrac49/HASiBP1wHWej8f+
         dw7pG7z5sFP21cKP7yah3zX7A7HG/7TY0e5tUuh6t/yYvPSX7IQXqP+ve6y4uibALy
         etoEOKLQtblCv5j0GCVoCJ/z+rShmWuvGXcMZgXE=
Date:   Fri, 25 Sep 2020 16:36:55 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH leds + devicetree 13/13] leds: tca6507: use struct
 led_init_data when registering
Message-ID: <20200925163655.2353800d@nic.cz>
In-Reply-To: <48197a65-a17f-8e5e-98a7-633db1e1b791@gmail.com>
References: <20200919221548.29984-1-marek.behun@nic.cz>
        <20200919221548.29984-14-marek.behun@nic.cz>
        <48197a65-a17f-8e5e-98a7-633db1e1b791@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 25 Sep 2020 08:49:43 +0200
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> For all drivers you switch to using *ext() API DT bindings should be
> updated as well to let people know that they can now use 'function'
> and 'color' properties.
> 

I will look into this, thanks.
Marek
