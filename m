From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v9 2/2] leds: add driver for support Mellanox regmap LEDs
 for BMC and x86 platform
Date: Sat, 17 Feb 2018 22:55:00 +0100
Message-ID: <45298ab7-9558-3df4-57e7-c3c198a805b8@gmail.com>
References: <1518737870-73290-1-git-send-email-vadimp@mellanox.com>
 <fadb3132-9cc9-745e-2852-52b145f1a7ee@gmail.com> <20180216222558.GA5265@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f178.google.com ([209.85.128.178]:40921 "EHLO
        mail-wr0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751214AbeBQV4Q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Feb 2018 16:56:16 -0500
Received: by mail-wr0-f178.google.com with SMTP id o76so6088385wrb.7
        for <linux-leds@vger.kernel.org>; Sat, 17 Feb 2018 13:56:16 -0800 (PST)
In-Reply-To: <20180216222558.GA5265@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Vadim Pasternak <vadimp@mellanox.com>, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jiri@resnulli.us

On 02/16/2018 11:25 PM, Pavel Machek wrote:
> Hi!
> 
>>> +++ b/drivers/leds/leds-mlxreg.c
>>> @@ -0,0 +1,309 @@
>>> +/*
>>> + * Copyright (c) 2018 Mellanox Technologies. All rights reserved.
>>> + * Copyright (c) 2018 Vadim Pasternak <vadimp@mellanox.com>
>>> + *
>>> + * Redistribution and use in source and binary forms, with or without
>>> + * modification, are permitted provided that the following conditions are met:
>>> + *
>>> + * 1. Redistributions of source code must retain the above copyright
>>> + *    notice, this list of conditions and the following disclaimer.
>>> + * 2. Redistributions in binary form must reproduce the above copyright
>>> + *    notice, this list of conditions and the following disclaimer in the
>>> + *    documentation and/or other materials provided with the distribution.
>>> + * 3. Neither the names of the copyright holders nor the names of its
>>> + *    contributors may be used to endorse or promote products derived from
>>> + *    this software without specific prior written permission.
>>> + *
>>> + * Alternatively, this software may be distributed under the terms of the
>>> + * GNU General Public License ("GPL") version 2 as published by the Free
>>> + * Software Foundation.
>>> + *
>>> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
>>> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
>>> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
>>> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
>>> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
>>> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
>>> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
>>> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
>>> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
>>> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
>>> + * POSSIBILITY OF SUCH DAMAGE.
>>> + */
> 
> You may want to switch on to spdx next time you update the driver...
> 										Pavel
> 										
> 

Right, so I propose the following modification:

diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
index cc9f297..56d6f30 100644
--- a/drivers/leds/leds-mlxreg.c
+++ b/drivers/leds/leds-mlxreg.c
@@ -1,35 +1,7 @@
-/*
- * Copyright (c) 2018 Mellanox Technologies. All rights reserved.
- * Copyright (c) 2018 Vadim Pasternak <vadimp@mellanox.com>
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
are met:
- *
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- * 2. Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in the
- *    documentation and/or other materials provided with the distribution.
- * 3. Neither the names of the copyright holders nor the names of its
- *    contributors may be used to endorse or promote products derived from
- *    this software without specific prior written permission.
- *
- * Alternatively, this software may be distributed under the terms of the
- * GNU General Public License ("GPL") version 2 as published by the Free
- * Software Foundation.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS"
- * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE
- * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
- * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
- * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
- * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
- * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
OF THE
- * POSSIBILITY OF SUCH DAMAGE.
- */
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// Copyright (c) 2018 Mellanox Technologies. All rights reserved.
+// Copyright (c) 2018 Vadim Pasternak <vadimp@mellanox.com>



If everyone agrees I can fix the original commit in the linux-leds.git
by myself.

-- 
Best regards,
Jacek Anaszewski
