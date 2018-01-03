From: =?UTF-8?Q?Ga=c3=abtan_Carlier?= <gcembed@gmail.com>
Subject: Add driver for MCP45HV51 (digital potentiometer)
Date: Wed, 3 Jan 2018 17:08:42 +0100
Message-ID: <17da226a-247b-153a-6743-3e33264a1f0c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:37796 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751833AbeACQIp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Jan 2018 11:08:45 -0500
Received: by mail-wm0-f49.google.com with SMTP id f140so3499049wmd.2
        for <linux-leds@vger.kernel.org>; Wed, 03 Jan 2018 08:08:45 -0800 (PST)
Received: from [10.0.4.19] (34.16-66-87.adsl-static.isp.belgacom.be. [87.66.16.34])
        by smtp.googlemail.com with ESMTPSA id g7sm893186edf.50.2018.01.03.08.08.43
        for <linux-leds@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jan 2018 08:08:43 -0800 (PST)
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org

Dear,
I want to integrate MCP45HV51 I2C device to Linux kernel. It is a 
digital potentiometer.
I have several questions:
- Is "leds driver" the correct section ?
- On which existing I2C leds driver should I base my code to use the 
most recent API/pratice ?
- Maybe it is not needed to write a C driver and everything can be done 
via devicetree ?

Thank you for your help.
Best regards,
Gaëtan.
