Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2611FC433E0
	for <linux-leds@archiver.kernel.org>; Fri,  8 Jan 2021 15:46:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1F912368A
	for <linux-leds@archiver.kernel.org>; Fri,  8 Jan 2021 15:46:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbhAHPpt convert rfc822-to-8bit (ORCPT
        <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 8 Jan 2021 10:45:49 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39228 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbhAHPpt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 8 Jan 2021 10:45:49 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 152511C0B81; Fri,  8 Jan 2021 16:45:07 +0100 (CET)
Date:   Fri, 8 Jan 2021 16:45:06 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Zheng Yongjun <zhengyongjun3@huawei.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 -next] leds: convert comma to semicolon
Message-ID: <20210108154506.GA7047@localhost>
References: <20210108092446.19547-1-zhengyongjun3@huawei.com>
 <fde7dc3b-9ca6-6009-eb16-b325641e3f4a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <fde7dc3b-9ca6-6009-eb16-b325641e3f4a@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri 2021-01-08 07:14:08, Dan Murphy wrote:
> Hello
> 
> On 1/8/21 3:24 AM, Zheng Yongjun wrote:
> > Replace a comma between expression statements by a semicolon.
> 
> Can you add a "Fixes" tag here?

Don't. Its just cleanup, we don't want it in stable. Patch is fine as is.

-- 
