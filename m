From: Juergen Schindele <schindele@nentec.de>
Subject: Switching off LED triggers udev
Date: Mon, 10 Apr 2017 16:29:30 +0200
Message-ID: <1803981.yiQbQ3iWBI@sherry>
Reply-To: schindele@nentec.de
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from gate.nentec.de ([213.218.23.37]:20800 "HELO dmz-mail.nentec.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with SMTP
        id S1752912AbdDJOjk (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 Apr 2017 10:39:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.nentec.de (Postfix) with ESMTP id 5F9EF17E0574
        for <linux-leds@vger.kernel.org>; Mon, 10 Apr 2017 16:20:18 +0200 (CEST)
Received: from zimbra.nentec.de ([127.0.0.1])
        by localhost (zimbra.nentec.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GtjUP_3hiVL9 for <linux-leds@vger.kernel.org>;
        Mon, 10 Apr 2017 16:20:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.nentec.de (Postfix) with ESMTP id 46E7217E0860
        for <linux-leds@vger.kernel.org>; Mon, 10 Apr 2017 16:20:18 +0200 (CEST)
Received: from zimbra.nentec.de ([127.0.0.1])
        by localhost (zimbra.nentec.de [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id FzNoUuBawiFA for <linux-leds@vger.kernel.org>;
        Mon, 10 Apr 2017 16:20:18 +0200 (CEST)
Received: from sherry.localnet (sherry.nentec.de [153.92.64.8])
        by zimbra.nentec.de (Postfix) with ESMTPS id 313F217E0574
        for <linux-leds@vger.kernel.org>; Mon, 10 Apr 2017 16:20:18 +0200 (CEST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org

Hello List,
i hope i found the right addres for this small problem.
I have a userspace daemon which controls leds via sysfs API
"/sys/class/leds/Soft1/brightness". Each time i turn the LED off
by writing 0 to brightness the /proc/sys/kernel/hotplug deamon 
is called with "ACTION:change SUBSYSTEM:leds DEVNAME:(null) 
DEVPATH:/devices/...."

from led-class.c ----------------------------
        if (state == LED_OFF)
                led_trigger_remove(led_cdev);
        __led_set_brightness(led_cdev, state);

But in fact there is no change of trigger because "none" was setup between 
enabling LED and disabling it. So from my point of view there is no change
from "none" to "remove" which justifies a "kobject_uevent_env(&led_cdev->dev-
>kobj, KOBJ_CHANGE, envp)".

To solve this problem of unusefull waste of CPU-time i suggest the following 
patch. Please consider the implementation which saved a lot of valuable CPU-
power in my case:

Index: drivers/leds/led-triggers.c
===================================================================
--- drivers/leds/led-triggers.c (Revision 14968)
+++ drivers/leds/led-triggers.c (Arbeitskopie)
@@ -106,10 +106,11 @@
        const char *name;
 
        name = trig ? trig->name : "none";
-       event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);
 
        /* Remove any existing trigger */
        if (led_cdev->trigger) {
+               event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);
+
                write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, 
flags);
                list_del(&led_cdev->trig_list);
                write_unlock_irqrestore(&led_cdev->trigger->leddev_list_lock,
@@ -122,6 +123,8 @@
                led_set_brightness(led_cdev, LED_OFF);
        }
        if (trig) {
+               event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);
+
                write_lock_irqsave(&trig->leddev_list_lock, flags);
                list_add_tail(&led_cdev->trig_list, &trig->led_cdevs);
                write_unlock_irqrestore(&trig->leddev_list_lock, flags);

Thank you for your attention
-- 
i. A.
Jürgen Schindele
Softwareentwicklung

PSI Nentec GmbH
Greschbachstraße 12
76229 Karlsruhe
Deutschland
Telefon: +49 721 94249-51
Telefax: +49 721 94249-10
schindele@nentec.de
www.nentec.de

Geschäftsführung: Klaus Becker, Wolfgang Fischer
Sitz der Gesellschaft: Karlsruhe
Handelsregister: Amtsgericht Mannheim HRB 107658

Diese E-Mail enthält vertrauliche oder rechtlich geschützte Informationen. 
Wenn Sie nicht der vorgesehene Empfänger sind, informieren Sie bitte sofort 
den Absender und löschen Sie diese E-Mail. Das unbefugte Kopieren dieser E-
Mail oder die unbefugte Weitergabe der enthaltenen Informationen ist nicht 
gestattet.

The information contained in this message is confidential or protected by law. 
If you are not the intended recipient, please contact the sender and delete 
this message. Any unauthorised copying of this message or unauthorised 
distribution of the information contained herein is prohibited. 
