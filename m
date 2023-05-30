Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C811FC77B7A
	for <linux-leds@archiver.kernel.org>; Tue, 30 May 2023 12:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjE3MZt (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 30 May 2023 08:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjE3MZT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 May 2023 08:25:19 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E4E12B;
        Tue, 30 May 2023 05:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=bDQhN0x+CUPZOpFNUunL90W/yKC8DOCXjhtCDGyl0cI=; b=C6R0OvcB1NBWUPpp5Zs5NyH4VI
        i43NhALPY2gwophlerpdKh8Lo6SbrifoRZ/+KWA7ed3s/jp+wSJe4KhEysbw00v0fGvPyyCfI4tcs
        6VvR8gOaTs5kUbmBYO82h2t7qq/YX2Pr42zwaryaD+B2uMKF9+4gR1E2cgoEz1gigLmQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q3yPA-00EJyN-Be; Tue, 30 May 2023 14:24:48 +0200
Date:   Tue, 30 May 2023 14:24:48 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Christian Marangi <ansuelsmth@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-leds@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [net-next PATCH v3 03/13] Documentation: leds: leds-class:
 Document new Hardware driven LEDs APIs
Message-ID: <6db5b691-a1cb-4f74-bb0d-6b48a1678c65@lunn.ch>
References: <20230527112854.2366-1-ansuelsmth@gmail.com>
 <20230527112854.2366-4-ansuelsmth@gmail.com>
 <ZHRd5wDnMrWZlwrd@debian.me>
 <871qiz5iqt.fsf@meer.lwn.net>
 <6474b526.050a0220.baa3e.31c1@mx.google.com>
 <2b8dbe95-c7e9-5158-93f6-865306a661b0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b8dbe95-c7e9-5158-93f6-865306a661b0@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, May 30, 2023 at 10:09:28AM +0700, Bagas Sanjaya wrote:
> On 5/29/23 21:09, Christian Marangi wrote:
> > Just to clarify, a device name can't be returned. Not every device have
> > a name and such name can be changed. An example is network device where
> > you can change the name of the interface.
> > 
> > Using the device prevents all of this problem. 
> > 
> 
> Oh, I guess it was /dev/something.

Network devices don't appear in /dev. At least not in Linux. Some
other Unix implementations do, i think SunOS used to have an entry in
/dev, but i could be remembering wrongly.

But within the kernel, you generally don't refer to a device by its
/dev/foo name. That is a user space abstraction. In the kernel, each
device in the system has a struct device representing it.

       Andrew
