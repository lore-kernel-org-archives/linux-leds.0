Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CBFC4361B
	for <linux-leds@archiver.kernel.org>; Sun, 13 Dec 2020 08:52:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D47332250E
	for <linux-leds@archiver.kernel.org>; Sun, 13 Dec 2020 08:52:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405183AbgLMIvy (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 13 Dec 2020 03:51:54 -0500
Received: from smtprelay0076.hostedemail.com ([216.40.44.76]:38286 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728170AbgLMIvr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sun, 13 Dec 2020 03:51:47 -0500
X-Greylist: delayed 646 seconds by postgrey-1.27 at vger.kernel.org; Sun, 13 Dec 2020 03:51:47 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 3959D1800084D
        for <linux-leds@vger.kernel.org>; Sun, 13 Dec 2020 08:40:55 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 172151E06;
        Sun, 13 Dec 2020 08:40:14 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: neck30_631061227410
X-Filterd-Recvd-Size: 1954
Received: from XPS-9350.home (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Sun, 13 Dec 2020 08:40:11 +0000 (UTC)
Message-ID: <3ce8fa0c0d7a2c38b532bd4944f4158cfa0db072.camel@perches.com>
Subject: Re: [PATCH] leds: Use DEVICE_ATTR_{RW, RO, WO} macros
From:   Joe Perches <joe@perches.com>
To:     Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-leds@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Date:   Sun, 13 Dec 2020 00:40:10 -0800
In-Reply-To: <CABJPP5BeB-aXDDk-8vy-8dOaNaM5jitx6QWKtV7Y3zXM5DgvUA@mail.gmail.com>
References: <20201212195548.231494-1-dwaipayanray1@gmail.com>
         <CAKXUXMx9EnhWhGAJf4ousAgkxDUrN=g2zGaPEk6ijJYse7VJaQ@mail.gmail.com>
         <CABJPP5BeB-aXDDk-8vy-8dOaNaM5jitx6QWKtV7Y3zXM5DgvUA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 2020-12-13 at 13:48 +0530, Dwaipayan Ray wrote:
> On Sun, Dec 13, 2020 at 1:31 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
[]
> > Will you also add a checkpatch rule to identify other DEVICE_ATTR(...)
> > that can be adjusted to the refined macros, so that checkpatch informs
> > other submitters as well?
> > 
> I think a checkpatch rule for this already exists. But it cannot automatically
> rename the function names. That might be the only drawback we got.
> Probably clang-format could fix these automatically.

clang-format is not a tool to rewrite code only neaten its layout.

coccinelle _might_ be able to do this for limited cases where the
show function is in the same compilation unit/file, but even then
it would not be a trivial script.


