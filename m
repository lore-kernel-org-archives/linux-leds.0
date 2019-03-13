From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 4/4] leds: lm3532: Introduce the lm3532 LED driver
Date: Wed, 13 Mar 2019 08:49:09 -0700
Message-ID: <dae1f4224eeaaf4eb6f3daeaf31d51af17a5b083.camel@perches.com>
References: <20190307220947.20057-1-dmurphy@ti.com>
         <20190307220947.20057-4-dmurphy@ti.com>
         <8ac4d84f-c792-893d-fbae-fac88fac8631@gmail.com>
         <bb621d08-c192-0018-f67e-3f3262a71b6f@ti.com>
         <cf26b351-f2b5-8345-29b7-401153b5f0d7@gmail.com>
         <ee13f836-bd77-22b0-e230-2fc9050afe88@ti.com>
         <09ee942fb7be08c600c989217ad3abfe4b6702fd.camel@perches.com>
         <c3743a0e-9efd-e179-098c-31b1242870b4@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c3743a0e-9efd-e179-098c-31b1242870b4@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, pavel@ucw.cz, tony@atomide.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, 2019-03-11 at 12:47 -0500, Dan Murphy wrote:
> On 3/11/19 12:30 PM, Joe Perches wrote:
> > On Mon, 2019-03-11 at 12:24 -0500, Dan Murphy wrote:
> > > checkpatch takes issue with // in headers.
> > > Unless they have removed that requirement.
[]
> I guess I was referring to this SPDX warning
>  
> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> #1: FILE: drivers/net/can/m_can/m_can.h:1:
> +//SPDX-License-Identifier: GPL-2.0

The general form uses a space after the //

And much more recently:

commit fdf13693d370653013eec3bc7f80a3f535001bf0
Author: Joe Perches <joe@perches.com>
Date:   Thu Mar 7 16:28:32 2019 -0800

    checkpatch: verify SPDX comment style
    
    Using SPDX commenting style // or /* is specified for various file types
    in Documentation/process/license-rules.rst so add an appropriate test for
    .[chsS] files because many proposed file additions and patches do not use
    the correct style.
