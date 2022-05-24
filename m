Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE7CC433EF
	for <linux-leds@archiver.kernel.org>; Tue, 24 May 2022 18:26:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240326AbiEXS0W (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 24 May 2022 14:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbiEXS0V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 May 2022 14:26:21 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD581D0D6;
        Tue, 24 May 2022 11:26:16 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6177A2058D;
        Tue, 24 May 2022 20:26:15 +0200 (CEST)
Date:   Tue, 24 May 2022 20:26:14 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Richard Purdie <rpurdie@rpsys.net>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Message-ID: <20220524182614.rwqjcmglc6jawbxq@SoMainline.org>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20220523163038.GA9124@duo.ucw.cz>
 <CAOCOHw7N9EHcxSSe6n8828oy2fh6xNxRYf9OUXkY4SQh6gtVLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCOHw7N9EHcxSSe6n8828oy2fh6xNxRYf9OUXkY4SQh6gtVLw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2022-05-24 10:02:51, Bjorn Andersson wrote:
[..]
> > I'd really like to see the patch fixing the pattern interface (or
> > disabling it). I don't want to push the tree to Linus with that bug.
> >
> 
> Please find a proposed update to lpg_pattern_set() and the documentation at:
> https://lore.kernel.org/linux-arm-msm/20220523233719.1496297-1-bjorn.andersson@linaro.org/T/#u
> 
> @Marijn, would love to get your input on this proposal.

Thanks, it looks good from a first observation but I'll test out the
implementation later.  Meanwhile, curious to your progress on processing
the last review :)

- Marijn
