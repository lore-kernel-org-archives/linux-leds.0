From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] leds: clevo-mail: Fix incorrect placement of __initdata
Date: Wed,  7 Aug 2013 15:00:42 +0530
Message-ID: <1375867843-19162-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:46767 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932360Ab3HGJr2 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 7 Aug 2013 05:47:28 -0400
Received: by mail-pa0-f53.google.com with SMTP id lb1so1943374pab.40
        for <linux-leds@vger.kernel.org>; Wed, 07 Aug 2013 02:47:28 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, rpurdie@rpsys.net, sachin.kamat@linaro.org, =?UTF-8?q?M=C3=A1rton=20N=C3=A9meth?= <nm127@freemail.hu>

__initdata should be placed between the variable name and equal
sign for the variable to be placed in the intended section.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: M=C3=A1rton N=C3=A9meth <nm127@freemail.hu>
---
 drivers/leds/leds-clevo-mail.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clevo-m=
ail.c
index 6a8405d..d93e245 100644
--- a/drivers/leds/leds-clevo-mail.c
+++ b/drivers/leds/leds-clevo-mail.c
@@ -40,7 +40,7 @@ static int __init clevo_mail_led_dmi_callback(const s=
truct dmi_system_id *id)
  * detected as working, but in reality it is not) as low as
  * possible.
  */
-static struct dmi_system_id __initdata clevo_mail_led_dmi_table[] =3D =
{
+static struct dmi_system_id clevo_mail_led_dmi_table[] __initdata =3D =
{
 	{
 		.callback =3D clevo_mail_led_dmi_callback,
 		.ident =3D "Clevo D410J",
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-leds" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
