Return-Path: <SRS0=kkVv=DA=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA2BC2D0A8
	for <linux-leds@archiver.kernel.org>; Wed, 23 Sep 2020 18:50:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7810206DB
	for <linux-leds@archiver.kernel.org>; Wed, 23 Sep 2020 18:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgIWSuB (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 23 Sep 2020 14:50:01 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:54530 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgIWSuB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Sep 2020 14:50:01 -0400
Received: from [192.168.42.210] ([93.23.14.114])
        by mwinf5d03 with ME
        id XWpw230062Tev1p03Wpw2y; Wed, 23 Sep 2020 20:49:58 +0200
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 23 Sep 2020 20:49:58 +0200
X-ME-IP: 93.23.14.114
Subject: Re: [PATCH] leds: lp50xx: Fix an error handling path in
 'lp50xx_probe_dt()'
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     pavel@ucw.cz, dmurphy@ti.com, jacek.anaszewski@gmail.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
 <20200923133510.GJ4282@kadam>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <faa49efc-5ba5-b6bd-b486-2f7c4611219b@wanadoo.fr>
Date:   Wed, 23 Sep 2020 20:49:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200923133510.GJ4282@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Le 23/09/2020 à 15:35, Dan Carpenter a écrit :
> I've added Heikki Krogerus to the CC list because my question is mostly
> about commit 59abd83672f7 ("drivers: base: Introducing software nodes to
> the firmware node framework").
> 
> I have been trying to teach Smatch to understand reference counting so
> it can discover these kinds of bugs automatically.
> 
> I don't know how software_node_get_next_child() can work when it doesn't
> call kobject_get().  This sort of bug would have been caught in testing
> because it affects the success path so I must be reading the code wrong.
> 

I had the same reading of the code and thought that I was missing 
something somewhere.

There is the same question about 'acpi_get_next_subnode' which is also a 
'.get_next_child_node' function, without any ref counting, if I'm correct.

CJ
