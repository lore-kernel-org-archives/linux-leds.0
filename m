Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70A5C4167B
	for <linux-leds@archiver.kernel.org>; Tue, 27 Dec 2022 22:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiL0WlV (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 27 Dec 2022 17:41:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiL0WlM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Dec 2022 17:41:12 -0500
X-Greylist: delayed 571 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 27 Dec 2022 14:41:11 PST
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [IPv6:2001:67c:2050:103:465::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937EA25D8;
        Tue, 27 Dec 2022 14:41:11 -0800 (PST)
Received: from smtp1.mailbox.org (unknown [91.198.250.123])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4NhTsP0hcVz9slg;
        Tue, 27 Dec 2022 23:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1672180297; h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type; bh=3yIkxBK2GwDUmlTb+vf0D6IfPi4hxUMjEDhQ+KHTCpY=;
        b=DVd7X+832rGnDKeEtTkB4dQIcoKpUZzKvN/zZAp4/9yxkBXd7CaIpUJyZxTwr9Pj2ILZtt
        lf0VjMAqcUr/ryod7FLMGtUCDed81H9Li1oPdImYtowIUvmGMUsOwZC5weS6qS2cuKox+4
        OhCCXgTeT1+7xNa0cnpe4m0PBzxmLuSet2vZKcgdnMx+2Ut7tYrb4J9Vxuf/dbhaESA/SI
        zBMchHZBGJPrRQlFE2rEKDezlDqpmsHIOtpfYpxJVoM/zHETwiwSko5b2tDpoDiE3969mP
        01HnrHwVCABVDiBxApzU9JHrAlbWP8rxN5S1VEkqA/1QYVFqqDKzDv0DxQTg1A==
Date:   Tue, 27 Dec 2022 16:31:31 -0600
From:   jstrauss <jstrauss@mailbox.org>
To:     conor@kernel.org
Cc:     christophe.jaillet@wanadoo.fr, jansimon.moeller@gmx.de,
        lee@kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, pavel@ucw.cz
Subject: Re: [PATCH RESEND] Add multicolor support to BlinkM LED driver
Message-ID: <20221227223131.um6muahhxbom7crg@libretux>
Reply-To: Y6slQLto568WfmfZ@spud
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MBO-RS-META: 7nsytfipm8s4wgxwn1ec3ec3iufxfnui
X-MBO-RS-ID: c7554801159cd17ce67
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Conor,

Thanks for the insight, I suspected it was some silent Proton issue. I
have switched to Mailbox.org, so all of my future emails and patches
will originate from this address.

Joe
