From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] leds: Clarify supported chips by LM355x driver
Date: Sun, 28 Jan 2018 16:30:09 +0200
Message-ID: <1517149809.7000.1288.camel@linux.intel.com>
References: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
         <0bbb47ba-4b4f-263f-a8f3-aad13d7bd753@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga18.intel.com ([134.134.136.126]:63181 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751697AbeA1OaN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 28 Jan 2018 09:30:13 -0500
In-Reply-To: <0bbb47ba-4b4f-263f-a8f3-aad13d7bd753@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org

On Fri, 2018-01-26 at 21:39 +0100, Jacek Anaszewski wrote:
> On 01/26/2018 08:38 AM, Andy Shevchenko wrote:

> > +	  Note, LM3555 is driven by AS3645A.
> 
> Could you please provide more details on this relationship?
> Looking at the datasheet it seems that both chips are standalone
> and controlled via I2C and/or via GPIO in case of LM3555.

The only difference I see looking in datasheets again that AS3645A
supports dual-led mode, by using STROBE signal in case of parallel
interface or thru additional bits in I2C mode.

Can you be more specific what exactly makes you feel that they are not
compatible?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
