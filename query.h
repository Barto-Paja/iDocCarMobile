#ifndef QUERY_H
#define QUERY_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>
#include <QString>
#include <QSqlError>

class Query : public QObject
{
    Q_OBJECT
public:
    explicit Query(QObject *parent = nullptr);
    Q_INVOKABLE void printMessage(QString txt);
    Q_INVOKABLE bool testMessage(QString txt);

    //--- Login ---//
    Q_INVOKABLE bool isOpen();
    Q_INVOKABLE bool isUser(QString login, QString password);

signals:

public slots:

private:

    QSqlQuery *query;
    static int userId;
};

#endif // QUERY_H
