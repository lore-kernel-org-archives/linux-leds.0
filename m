Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55270C4332F
	for <linux-leds@archiver.kernel.org>; Fri, 23 Dec 2022 12:15:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbiLWMP3 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 23 Dec 2022 07:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiLWMP2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 23 Dec 2022 07:15:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68EB5227;
        Fri, 23 Dec 2022 04:15:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 19C12B82042;
        Fri, 23 Dec 2022 12:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20006C433EF;
        Fri, 23 Dec 2022 12:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671797724;
        bh=3qHrdzo0yiyM+k5ftk9PiRWr0PqN2y7NcelN5zpN6yI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UuhgSf5JAAohkzwz/zeYz95wIN0BlJjcRRBwt7yIESfunUIFKvSJYH1Bev9NJ18h3
         D81u8v+99iaq77b8Njj0lX8apCHNJwUW8bu9bMBi4rHxs/vjZ0eSfG2eUwPTfvUuiu
         cyN8ERoppGzVYXfJlQTnI/hdLz8vaLTgUH0sgEX+Gb/SsX7oQ8Ixb0CEEDkq+Og4ag
         OgtaPW2SgwZzNUJ7QlroTrOCRgcFT4avRvR73IsmQyCVYN7Jip49OHy5NWqNMNY4rw
         /CRtqaE58Dj7GGjbvEcLEpSKfyz6fk5udLb3w+uNp0GzY3+1XnDQEqvRcEdYc5Cv6s
         HjbS0r/RKc+Rw==
Date:   Fri, 23 Dec 2022 12:15:19 +0000
From:   Lee Jones <lee@kernel.org>
To:     Joseph Strauss <jstrauss16@proton.me>
Cc:     pavel@ucw.cz, jansimon.moeller@gmx.de, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] Add multicolor support to BlinkM LED driver
Message-ID: <Y6Wb1+VrutfKtGIo@google.com>
References: <20221214222428.7518-1-jstrauss16@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221214222428.7518-1-jstrauss16@proton.me>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 14 Dec 2022, Joseph Strauss wrote:

Would you mind composing your mails such that my Key Manager doens't ask
me for a password in order to view them please?

-- 
Lee Jones [李琼斯]
