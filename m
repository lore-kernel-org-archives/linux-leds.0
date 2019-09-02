Return-Path: <SRS0=xqjG=W5=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0C4C3A59E
	for <linux-leds@archiver.kernel.org>; Mon,  2 Sep 2019 21:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1C4422CF7
	for <linux-leds@archiver.kernel.org>; Mon,  2 Sep 2019 21:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567460406;
	bh=BhQWHzRLArBrgscAK9ICPp+UI2uEX648KgfK1fDuUPU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=IFmxMsIFuPV5JYcSibZy/tu35XQZi3OYQJNVNvEAF1L5GntOjAqJ+Cvp5MgN0EnM+
	 UEzyDlzdvpP0W3JpBzjl+SzLYaIOLNT63CuddenQUqj2D4APaLWyeHxmFniOppji4z
	 WLfbmooifu69/ANsGvP62erfLxZ3eSGFvFU1pGkE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfIBVkG (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 2 Sep 2019 17:40:06 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41176 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727603AbfIBVkG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 Sep 2019 17:40:06 -0400
Received: by mail-oi1-f193.google.com with SMTP id h4so7860633oih.8;
        Mon, 02 Sep 2019 14:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JXbN/yi7X93TMH+BXS2cXuMz8NVjciWZDxzvL0VB4L4=;
        b=CQHWj7I3oDdztaOrRovr8vQbgK97nQhG8cBbkqm3g12NKCGyMwVHk787moyLfyEKVY
         dUqDHuMf7X2JFUm/FBldZ0sebq/aa7HaZmnakUvx3fC23QgzNBybWsAOOv9HFe7GIRre
         Z5fP+PMWACgeGl2kXrOcFyR5WvyQxpwcBhFPjnQ9k8p4yqPR8ioU4TCOepfhIs9AEe0m
         s5ofc4JwxCnJsC6sExlmlv4sxiV+CfCb4GhVjYNl5hTreby9Qrzupwk64eYtLaelO5Uq
         27ORESW4YVHcNi+AkAUnoN9+OosXMw+WnNBfdDnK9E1xozLvML4Iscn9PPO4KBb2RovR
         nJ4Q==
X-Gm-Message-State: APjAAAXG/QITSfKmd1fiiXH1vc55zFAyI9GsN1bBd0w/LyXUOS2dNcBT
        hXzR7QyKXKP2D5XwpQzgdjUQnSslLZ9L0u5Gh+Y=
X-Google-Smtp-Source: APXvYqzqBjJPL/bu4gNX/O8T8mByKAZ/PuQesuWjrdVROv7VuQ/k9Mxe9LY3rQeHY/S5nzLTB61QqWBUIRarL3UkShg=
X-Received: by 2002:aca:50ca:: with SMTP id e193mr8956207oib.110.1567460405306;
 Mon, 02 Sep 2019 14:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <1567346932-16744-1-git-send-email-akinobu.mita@gmail.com> <20190901142304.GA20868@owl.dominikbrodowski.net>
In-Reply-To: <20190901142304.GA20868@owl.dominikbrodowski.net>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 2 Sep 2019 23:39:54 +0200
Message-ID: <CAJZ5v0jgEtyEPh6qYKOkKzYtzixDbtN41m1sUS9tab1Em04AFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] PM-runtime: Documentation: add runtime_status ABI document
To:     Dominik Brodowski <linux@dominikbrodowski.net>,
        Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, Linux PM <linux-pm@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Sep 1, 2019 at 4:30 PM Dominik Brodowski
<linux@dominikbrodowski.net> wrote:
>
> Hi!
>
> On Sun, Sep 01, 2019 at 11:08:51PM +0900, Akinobu Mita wrote:
> > +What:                /sys/devices/.../power/runtime_status
> > +Date:                April 2010
> > +Contact:     Dominik Brodowski <linux@dominikbrodowski.net>
>
> Thanks for the patch! I am not sure, however, whether I am the right contact
> person here -- maybe Rafael J. Wysocki as PM maintainer?

Right, please follow the convention used for the other attributes
documented in this file.
