Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429B1C001DB
	for <linux-leds@archiver.kernel.org>; Tue, 15 Aug 2023 13:20:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237430AbjHONUQ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 15 Aug 2023 09:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237433AbjHONUB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Aug 2023 09:20:01 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C651987
        for <linux-leds@vger.kernel.org>; Tue, 15 Aug 2023 06:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=OpdROE7eo08WNZRW+In9lATLzQWJlj+hvDT7eJjyYsY=; b=AymRRhRQw6soK1VuQ9yhyiIjjY
        e/G+9vcLDtp5oRLlMboZvHO8yfODLTR0Bkgv87oSpriPFxEXHoDkJylXtkMKNnADq2+y7OH/gAWkF
        IAMHCnU6bTPrCWPKjPEbqDX5SnFF2tnGrKZw+i+SUD8OO+oj889oUaZfM7cOSBIC8Zp0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qVtxf-0049tQ-2y; Tue, 15 Aug 2023 15:19:51 +0200
Date:   Tue, 15 Aug 2023 15:19:51 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Li Zetao <lizetao1@huawei.com>
Cc:     pavel@ucw.cz, lee@kernel.org, ansuelsmth@gmail.com,
        davem@davemloft.net, kuba@kernel.org, dan.carpenter@linaro.org,
        yang.lee@linux.alibaba.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH -next 2/2] leds: Use module_misc_device macro to simplify
 the code
Message-ID: <d958205b-a8b7-4227-8f8e-82f09bcc56c4@lunn.ch>
References: <20230815075944.1089298-1-lizetao1@huawei.com>
 <20230815075944.1089298-3-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815075944.1089298-3-lizetao1@huawei.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Aug 15, 2023 at 03:59:44PM +0800, Li Zetao wrote:
> Use the module_misc_device macro to simplify the code, which is the
> same as declaring with module_init() and module_exit().
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
