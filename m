Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D226C4743E
	for <linux-leds@archiver.kernel.org>; Fri, 18 Dec 2020 14:37:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D17DC23AAA
	for <linux-leds@archiver.kernel.org>; Fri, 18 Dec 2020 14:37:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729106AbgLROhA (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 18 Dec 2020 09:37:00 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:62024 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729109AbgLROg5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Dec 2020 09:36:57 -0500
Received: from fsav402.sakura.ne.jp (fsav402.sakura.ne.jp [133.242.250.101])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 0BIEaFQr098344;
        Fri, 18 Dec 2020 23:36:15 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav402.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav402.sakura.ne.jp);
 Fri, 18 Dec 2020 23:36:15 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav402.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 0BIEaEDS098333
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 18 Dec 2020 23:36:15 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH 2/4] hung_task: Replace "did_panic" with is_be_panic()
To:     Pavel Machek <pavel@ucw.cz>, Xiaoming Ni <nixiaoming@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        dmurphy@ti.com, akpm@linux-foundation.org, keescook@chromium.org,
        gpiccoli@canonical.com, wangle6@huawei.com
References: <20201218114406.61906-1-nixiaoming@huawei.com>
 <20201218114406.61906-3-nixiaoming@huawei.com>
 <20201218125957.GA20160@duo.ucw.cz>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <eddf7043-4bbe-7440-6c3e-ff272f722a86@i-love.sakura.ne.jp>
Date:   Fri, 18 Dec 2020 23:36:13 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201218125957.GA20160@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2020/12/18 21:59, Pavel Machek wrote:
> On Fri 2020-12-18 19:44:04, Xiaoming Ni wrote:
> Plus.. is_being_panic is not really english. "is_paniccing" would be
> closer...?

Or in_panic() ?
