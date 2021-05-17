Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71858C433ED
	for <linux-leds@archiver.kernel.org>; Mon, 17 May 2021 08:19:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5893560C3D
	for <linux-leds@archiver.kernel.org>; Mon, 17 May 2021 08:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235477AbhEQIUY (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 17 May 2021 04:20:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:53468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235685AbhEQIUQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 17 May 2021 04:20:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EFB061285;
        Mon, 17 May 2021 08:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621239539;
        bh=YMJxBbd5NomzA9GZTlbdHn9jmA9o1/GA0kk6JvG6TcU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i3lO7O3I0fIoX/Jlep8hzzOWfDTxbEVhGjTkkAoTRHC8B7gDbkw0S0fJrb0+yyh+v
         Rp6TTg/xJ/JNszezmGgpApYqgpS2gCKIbI2gj+CEQ4BZEUXT16+lFESJrpwzRRoN/3
         GiK8dq8m41/DvVO3VChcSLZzTnrsxQ4Rm0VOY72U=
Date:   Mon, 17 May 2021 10:18:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/17] Add an experimental driver for Intel NUC leds
Message-ID: <YKIm8TNJfXIMFl+W@kroah.com>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, May 16, 2021 at 12:53:28PM +0200, Mauro Carvalho Chehab wrote:
> Hi Greg,
> 
> This series add support for the LEDs found at Intel NUCs since
> NUC version 6.
> 
> On several NUC models, the function of the LEDs are programmable,
> which allow them to indicate several different hardware events.
> 
> They can even be programmed to represent an userspace-driven event.
> 
> Some models come with single colored or dual-colored LEDs, but
> high end models have RGB LEDs.
> 
> Programming them can ether be done via BIOS or by the OS.
> 
> There are 3 different API types, and there is already some OOT
> drivers that were written to support them, using procfs, each
> one using a different (and IMO confusing) API.
> 
> After looking at the existing drivers and not liking the uAPI
> interfaces there, I opted to write a new driver from scratch,
> unifying support for all different versions and using sysfs
> via the leds class.

Just do this the "right way" and not add it to staging first.  Just use
the existing LED class apis and all should be fine, no need for doing
anything unusual here.

thanks,m

greg k-h
